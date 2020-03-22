//
//  BaseDataProvider.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import CoreData

class BaseDataProdier{
    lazy var persistentContainer: NSPersistentContainer = {
 
        let container = NSPersistentContainer(name: "DBModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    internal func Save(managedObjectContext: NSManagedObjectContext){
        do {
               // Save Managed Object Context
               try managedObjectContext.save()

           } catch {
               print("Unable to save managed object context.")
           }
    }
}

