//
//  RemidDataProvider.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import CoreData

class RemindDataProvider : BaseDataProdier, DataProvider {
    
    typealias TEntity = Remind
    
    func Save(entity: Remind) {
        let context = self.persistentContainer.viewContext
        let dbEntity = NSEntityDescription.entity(forEntityName: "Remind", in: context)!
        let remind = NSManagedObject(entity: dbEntity, insertInto: context)
        remind.setValue(entity.descriptionData, forKey: "descriptionData")
        
        super.Save(managedObjectContext: context)
    }
    
    func Get(predicate: NSPredicate) -> Remind? {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Remind")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = predicate
        
        do {
          let items = try context.fetch(fetchRequest)
          return (items as! [Remind]).first
        } catch {
            print("Error while fetching data!")
        }
        return nil
    }
    
    func GetAll() -> [Remind] {
        return [Remind]()
    }
    
}