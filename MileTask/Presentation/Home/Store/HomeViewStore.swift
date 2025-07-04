//
//  HomeViewStore.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import ComposableArchitecture
import MileTaskComponent
import MileTaskDomain
import Combine

@Reducer
struct HomeViewStore {
    @Dependency(\.mainCoreEnv) var env

    @ObservableState
    struct State: Equatable {
        var tasks: DataViewState<[TaskModel]> = .loading
    }

    enum Action: Equatable {
        case viewWillAppear
        case getTasks
        case mapTasksResponse([TaskModel])
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .viewWillAppear:
                return Effect.merge(
                    .send(.getTasks)
                )
            case .getTasks:
                state.tasks = .loading
                let epics = env.getTasks()
                return .send(.mapTasksResponse(epics))

            case .mapTasksResponse(let result):
                if result.isEmpty {
                    state.tasks = .empty
                } else {
                    state.tasks = .data(result)
                }

                return .none
            }
        }
    }
}
