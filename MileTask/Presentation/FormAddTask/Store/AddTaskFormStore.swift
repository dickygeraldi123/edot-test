//
//  AddTaskFormStore.swift
//  MileTask
//
//  Created by asani on 29/06/25.
//

import ComposableArchitecture
import MileTaskDomain
import Combine
import MileTaskStorage

@Reducer
struct AddTaskFormStore {
    private let env: MainCoreEnv = .live

    @ObservableState
    struct State: Equatable {
        let router: AddTaskFormRouter
        var taskName: String = ""
        var priority: String = ""
        var dueDate: Date = Date()
        var startDate: Date = Date()
        var allPriority: [String] = []
        var enableButton: Bool = false

        init(router: AddTaskFormRouter) {
            self.router = router
        }
    }

    enum Action {
        case backView
        case viewDidLoad
        case mapPriority(String)
        case mapTaskName(String)
        case mapStartDate(Date)
        case mapDueDate(Date)
        case validateButton
        case getPriority
        case saveTask
        case emptyAction
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .backView:
                state.router.popView()
                return .none

            case .viewDidLoad:
                return .send(.getPriority)

            case .mapTaskName(let taskName):
                state.taskName = taskName
                return .send(.validateButton)

            case .mapStartDate(let startDate):
                state.startDate = startDate
                return .send(.validateButton)

            case .mapDueDate(let dueDate):
                state.dueDate = dueDate
                return .send(.validateButton)

            case .validateButton:
                let isTaskEmpty = state.taskName.isEmpty
                let isPriorityEmpty = state.priority.isEmpty
                let isSameStartDate = (state.startDate == Date())
                let isSameDueDate = (state.dueDate == Date())

                state.enableButton = (!isTaskEmpty && !isPriorityEmpty && !isSameStartDate && !isSameDueDate)

            case .getPriority:
                for data in PriorityTaskEnum.allCases {
                    state.allPriority.append(data.rawValue)
                }

            case .saveTask:
                let taskModel = TaskModel(context: CoreDataService.shared.context)

                taskModel.title = state.taskName
                taskModel.priority = state.priority
                taskModel.isCompleted = false
                taskModel.startDate = state.startDate.timeIntervalSince1970
                taskModel.dueDate = state.dueDate.timeIntervalSince1970

                env.saveTask(task: taskModel)
                let timeUntilStart = Date(timeIntervalSince1970: taskModel.startDate).timeIntervalSinceNow
                if timeUntilStart > 1 {
                    NotificationManager.shared.scheduleNotification(for: taskModel)
                }

                state.router.popView()

                return .none
            case .mapPriority(let priority):
                state.priority = priority
                return .send(.validateButton)

            case .emptyAction:
                return .none
            }

            return .none
        }
    }
}
