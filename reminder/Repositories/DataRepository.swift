//
//  DataRepository.swift
//  reminder
//
//  Created by Svyatoslav Titov on 17.05.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

public class DataRepository<TType> : ReadRepository {
    
    var dataProvider: AnyDataProvider<TType>
    
    init(_ dataProvider : AnyDataProvider<TType>) {
        self.dataProvider = dataProvider
    }
   
    public typealias TType = TType
    
    public func get(predicate: NSPredicate) -> DataPublisher<TType> {
        return DataPublisher<TType>(dataProvider.Get(predicate: predicate))
    }
}
