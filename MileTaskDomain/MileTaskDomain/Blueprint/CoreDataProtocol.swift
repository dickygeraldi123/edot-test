//
//  CoreDataProtocol.swift
//  MileTaskDomain
//
//  Created by asani on 27/06/25.
//

import CoreData

public protocol CoreDataProtocol {
    func save<T: NSManagedObject>(_ object: T)
    func delete<T: NSManagedObject>(_ object: T)
    func fetch<T: NSManagedObject>(_ type: T.Type,
                                    predicate: NSPredicate?,
                                    sortDescriptors: [NSSortDescriptor]?) -> [T]
}
