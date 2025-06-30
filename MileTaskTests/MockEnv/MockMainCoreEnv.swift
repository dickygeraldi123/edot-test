//
//  MockMainCoreEnv.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

@testable import MileTask
import MileTaskDomain

struct MockMainCoreEnv: MainCoreEnvProtocol {
    var getTasksResult: [TaskModel] = []
    var saveTaskCalled = false
    var savedTask: TaskModel?
    
    func getTasks() -> [TaskModel] {
        return getTasksResult
    }
    
    func saveTask(task: TaskModel) {
        saveTaskCalled = true
        savedTask = task
    }
}
