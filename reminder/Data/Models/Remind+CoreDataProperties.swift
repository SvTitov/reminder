//
//  Remind+CoreDataProperties.swift
//  reminder
//
//  Created by Svyatoslav Titov on 31.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//
//

import Foundation
import CoreData


extension Remind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Remind> {
        return NSFetchRequest<Remind>(entityName: "Remind")
    }

    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?

}
