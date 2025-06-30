//
//  HomeViewStoreTest.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import XCTest
@testable import MileTask
import ComposableArchitecture
import MileTaskDomain
import MileTaskStorage
import MileTaskComponent

@MainActor
final class HomeViewStoreTests: XCTestCase {
    func test_viewWillAppear_getsTasks() async {
        let mockTasks = [
            TaskModel.mock(title: "Task 1"),
            TaskModel.mock(title: "Task 2")
        ]

        var mockEnv = MockMainCoreEnv()
        mockEnv.getTasksResult = mockTasks

        let store = TestStore(
            initialState: HomeViewStore.State(),
            reducer: { HomeViewStore() },
            withDependencies: {
                $0.mainCoreEnv = mockEnv
            }
        )

        await store.send(.viewWillAppear)
        await store.receive(.getTasks)
        await store.receive(.mapTasksResponse(mockTasks)) {
            $0.tasks = .data(mockTasks)
        }
    }
    
    func test_emptyTaskList_showsEmptyState() async {
        var mockEnv = MockMainCoreEnv()
        mockEnv.getTasksResult = []

        let store = TestStore(
            initialState: HomeViewStore.State(),
            reducer: { HomeViewStore() },
            withDependencies: {
                $0.mainCoreEnv = mockEnv
            }
        )

        await store.send(.viewWillAppear)
        await store.receive(.getTasks)
        await store.receive(.mapTasksResponse([])) {
            $0.tasks = .empty
        }
    }
    
    func test_getTasks_showsLoadingState() async {
        let store = TestStore(
            initialState: HomeViewStore.State(),
            reducer: { HomeViewStore() }
        )

        await store.send(.getTasks) {
            $0.tasks = .loading
        }
    }
}

// MARK: - Test Helpers
extension TaskModel {
    static func mock(title: String) -> TaskModel {
        let task = TaskModel(context: CoreDataService.shared.context)
        task.id = UUID()
        task.title = title
        task.startDate = Date().timeIntervalSince1970
        return task
    }
}
