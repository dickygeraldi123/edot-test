//
//  MainCoreEnv.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import MileTaskDomain
import MileTaskStorage
import ComposableArchitecture

protocol MainCoreEnvProtocol {
    func getTasks() -> [TaskModel]
    func saveTask(task: TaskModel)
}

struct MainCoreEnv: MainCoreEnvProtocol {
    static let live = MainCoreEnv()
    private var coreDataService: CoreDataService

    init(coreDataService: CoreDataService = .shared) {
        self.coreDataService = coreDataService
    }

    func getTasks() -> [TaskModel] {
        coreDataService.fetch(
            TaskModel.self,
            sortDescriptors: [NSSortDescriptor(key: "startDate", ascending: false)]
        )
    }

    func saveTask(task: TaskModel) {
        coreDataService.save(task)
    }
}

private enum MainCoreEnvKey: DependencyKey {
    static let liveValue: any MainCoreEnvProtocol = MainCoreEnv.live
}

extension DependencyValues {
    var mainCoreEnv: any MainCoreEnvProtocol {
        get { self[MainCoreEnvKey.self] }
        set { self[MainCoreEnvKey.self] = newValue }
    }
}
