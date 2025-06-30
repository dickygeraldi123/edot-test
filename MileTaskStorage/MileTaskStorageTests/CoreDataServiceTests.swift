//
//  CoreDataServiceTests.swift
//  MileTaskStorage
//
//  Created by asani on 30/06/25.
//


import XCTest
import CoreData
import MileTaskDomain
@testable import MileTaskStorage

class CoreDataServiceTests: XCTestCase {
    var sut: CoreDataService!

    override func setUp() {
        super.setUp()
        sut = CoreDataService(forTesting: true)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_saveObject_successfullyInsertsObject() {
        let task = TaskModel(context: sut.context)
        task.id = UUID()
        task.title = "Test Task"

        sut.save(task)

        let fetchedTasks: [TaskModel] = sut.fetch(TaskModel.self)
        XCTAssertEqual(fetchedTasks.count, 1)
        XCTAssertEqual(fetchedTasks.first?.title, "Test Task")
    }
    
    func test_deleteObject_removesObjectFromContext() {
        let task = TaskModel(context: sut.context)
        task.id = UUID()
        task.title = "Task to Delete"
        sut.save(task)

        sut.delete(task)

        let fetchedTasks: [TaskModel] = sut.fetch(TaskModel.self)
        XCTAssertTrue(fetchedTasks.isEmpty)
    }

    func test_fetchWithPredicate_returnsFilteredResults() {
        let task1 = TaskModel(context: sut.context)
        task1.id = UUID()
        task1.title = "Important Task"
        task1.priority = "High"
        
        let task2 = TaskModel(context: sut.context)
        task2.id = UUID()
        task2.title = "Regular Task"
        task1.priority = "Low"
        
        sut.save(task1)
        sut.save(task2)

        let predicate = NSPredicate(format: "priority == %@", "High")
        let importantTasks: [TaskModel] = sut.fetch(TaskModel.self, predicate: predicate)

        XCTAssertEqual(importantTasks.count, 1)
        XCTAssertEqual(importantTasks.first?.title, "Important Task")
    }
    
    func test_fetchWithSortDescriptor_returnsSortedResults() {
        let task1 = TaskModel(context: sut.context)
        task1.id = UUID()
        task1.title = "B Task"
        task1.startDate = Date().addingTimeInterval(-100).timeIntervalSince1970
        
        let task2 = TaskModel(context: sut.context)
        task2.id = UUID()
        task2.title = "A Task"
        task2.startDate = Date().addingTimeInterval(-200).timeIntervalSince1970
        
        sut.save(task1)
        sut.save(task2)

        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        let sortedTasks: [TaskModel] = sut.fetch(TaskModel.self, sortDescriptors: [sortDescriptor])

        XCTAssertEqual(sortedTasks.count, 2)
        XCTAssertEqual(sortedTasks[0].title, "A Task")
        XCTAssertEqual(sortedTasks[1].title, "B Task")
    }
}
