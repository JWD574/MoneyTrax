//
//  CoreDataManager.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/6/22.
//

import Foundation
import CoreData



class CoreDataManager {
    
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to load Budget from the database (\(error)")
            }
        }
    }
}
