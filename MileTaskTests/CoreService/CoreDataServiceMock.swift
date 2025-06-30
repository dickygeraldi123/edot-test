//
//  CoreDataServiceMock.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import MileTaskStorage
import CoreData
import MileTaskDomain
@testable import MileTask

class MockCoreDataService: CoreDataProtocol {
    var persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext
    var saveCalled = false
    var deleteCalled = false
    var fetchCalled = false

    init() {
        persistentContainer = NSPersistentContainer(name: "MockModel")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        persistentContainer.loadPersistentStores { _, _ in }
        context = persistentContainer.viewContext
    }

    func save<T: NSManagedObject>(_ object: T) {
        saveCalled = true
        if object.managedObjectContext == nil {
            context.insert(object)
        }
        try? context.save()
    }

    func delete<T: NSManagedObject>(_ object: T) {
        deleteCalled = true
        context.delete(object)
        try? context.save()
    }

    func fetch<T: NSManagedObject>(
        _ type: T.Type,
        predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor]? = nil
    ) -> [T] {
        fetchCalled = true
        let request = T.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return (try? context.fetch(request) as? [T]) ?? []
    }
}
