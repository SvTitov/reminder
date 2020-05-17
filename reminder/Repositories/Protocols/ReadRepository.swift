//
//  ReadRepository.swift
//  reminder
//
//  Created by Svyatoslav Titov on 17.05.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

public protocol ReadRepository {
    associatedtype TType
    
    func get(predicate: NSPredicate) -> DataPublisher<TType>
}
