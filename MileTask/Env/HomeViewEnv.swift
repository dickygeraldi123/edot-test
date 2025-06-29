//
//  HomeViewEnv.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import MileTaskDomain
import MileTaskStorage
import ComposableArchitecture

struct HomeViewEnv {
    static var live = HomeViewEnv()

    private var coreDataService: CoreDataService = CoreDataService.shared
    
    // MARK: - Fetch Data
    func getTasks() -> [TaskModel] {
        let result: [TaskModel] = CoreDataService.shared.fetch(
            TaskModel.self,
            sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]
        )
        return result
    }
}
