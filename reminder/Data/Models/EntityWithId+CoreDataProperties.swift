//
//  EntityWithId+CoreDataProperties.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//
//

import Foundation
import CoreData


extension EntityWithId {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityWithId> {
        return NSFetchRequest<EntityWithId>(entityName: "EntityWithId")
    }

    @NSManaged public var id: Int32

}
