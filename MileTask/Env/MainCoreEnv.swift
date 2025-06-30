//
//  MainCoreEnv.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import MileTaskDomain
import MileTaskStorage
import ComposableArchitecture

struct MainCoreEnv {
    static var live = MainCoreEnv()

    private var coreDataService: CoreDataService = CoreDataService.shared
    
    // MARK: - Fetch Data
    func getTasks() -> [TaskModel] {
        let result: [TaskModel] = CoreDataService.shared.fetch(
            TaskModel.self,
            sortDescriptors: [NSSortDescriptor(key: "startDate", ascending: false)]
        )
        return result
    }

    func saveTask(task: TaskModel) {
        coreDataService.save(task)
    }
}
