//
//  RemidDataProvider.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import CoreData
import Combine

class RemindDataProvider : BaseDataProdier {
    let onAdd = PassthroughSubject<Remind,Never>()
}

extension RemindDataProvider : DataProvider {
    typealias TEntity = Remind
      
      func Save(entity: Remind) {
        let context = self.persistentContainer.viewContext
        let dbEntity = NSEntityDescription.entity(forEntityName: "Remind", in: context)!
        let remind = NSManagedObject(entity: dbEntity, insertInto: context)
        remind.setValue(entity.descriptionText, forKey: "descriptionText")
        remind.setValue(entity.title, forKey: "title")

        self.push(data: entity)

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
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Remind")
        
        do {
            let items = try context.fetch(fetchRequest)
            return (items as! [Remind])
        } catch {
            print("Error while fetching data!")
        }
        
        return []
    }
}

extension RemindDataProvider : DataPusher {
    func push(data: Remind?) {
        if let unwrappedData = data {
            onAdd.send(unwrappedData)
        }
    }
}
