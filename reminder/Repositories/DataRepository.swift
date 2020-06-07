//
//  DataRepository.swift
//  reminder
//
//  Created by Svyatoslav Titov on 17.05.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import Combine

public class DataRepository<TType> : ReadRepository {
 
    private var dataProvider: AnyDataProvider<TType>
    
    private var subscriptions: WeakArray<AnyObject> = WeakArray<AnyObject>([])
    
    init(_ dataProvider : AnyDataProvider<TType>) {
        self.dataProvider = dataProvider
    }
   
    public typealias TType = TType
    
    public func get(predicate: NSPredicate) -> DataPublisher<TType> {
        return DataPublisher<TType>(dataProvider.Get(predicate: predicate))
    }
    
    public func getAll() -> AnyPublisher<[TType], Never> {
        return getAllFromDataProvider()
            .eraseToAnyPublisher()
     }
    
    private func getAllFromDataProvider() -> Future<[TType], Never> {
        return Future { promise in
            DispatchQueue.global().async {
                let allData = self.dataProvider.GetAll()
                promise(.success(allData))
            }
        }
    }
}
