//
//  DataProvider.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

protocol DataProvider {
    associatedtype TEntity
    
    /**
     Save new entity to DB
     */
    func Save(entity: TEntity)
    
    /**
        Get entity by its ID
 
      - Parameter id: Entity id
     */
    func Get(predicate: NSPredicate) -> TEntity?
    
    /**
        Return all entities of current type
     
        - Returns: Array of entities
     */
    func GetAll() -> [TEntity]
}
