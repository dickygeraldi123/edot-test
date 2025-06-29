//
//  CoreDataService.swift
//  MileTaskStorage
//
//  Created by asani on 27/06/25.
//

import CoreData
import MileTaskDomain

public final class CoreDataService: CoreDataProtocol {
    public static let shared = CoreDataService()

    public let persistentContainer: NSPersistentContainer
    public var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private init() {
        let bundle = Bundle(for: TaskModel.self)
        guard let modelURL = bundle.url(forResource: "MileTaskModel", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("❌ Could not load Core Data model")
        }

        persistentContainer = NSPersistentContainer(name: "MileTaskModel", managedObjectModel: model)

        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("❌ Failed to load persistent stores: \(error)")
            }
        }
    }

    public func save<T: NSManagedObject>(_ object: T) {
        if object.managedObjectContext == nil {
            context.insert(object)
        }

        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            print("❌ Save failed for \(T.self): \(error)")
        }
    }

    public func delete<T: NSManagedObject>(_ object: T) {
        context.delete(object)
        saveContext()
    }

    public func fetch<T: NSManagedObject>(
        _ type: T.Type,
        predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor]? = nil
    ) -> [T] {
        let request = T.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors

        do {
            return try context.fetch(request) as? [T] ?? []
        } catch {
            print("❌ Fetch failed for \(T.self): \(error)")
            return []
        }
    }

    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("❌ Context save failed: \(error)")
        }
    }
}
