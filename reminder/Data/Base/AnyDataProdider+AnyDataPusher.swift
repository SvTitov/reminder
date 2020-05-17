//
//  AnyDataPusher.swift
//  reminder
//
//  Created by Svyatoslav Titov on 29.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

class AnyDataProvider<TData> : DataProvider {
    
    typealias TEntity = TData
    
    private var dataProviderSave: (TEntity) -> Void
    private var dataProviderGet:(NSPredicate) -> TData?
    private var dataProviderGetAll: ()-> [TData]
    
    init<TDataProvider: DataProvider>(provider: TDataProvider) where TDataProvider.TEntity == TData {
        self.dataProviderSave = provider.Save
        self.dataProviderGet = provider.Get
        self.dataProviderGetAll = provider.GetAll
    }
    
    func Save(entity: TData) {
        self.dataProviderSave(entity)
    }
    
    func Get(predicate: NSPredicate) -> TData? {
        return self.dataProviderGet(predicate)
    }
    
    func GetAll() -> [TData] {
        return self.dataProviderGetAll()
    }
    
    
}

/**
 Type erasure for DataPusher
 */
class AnyDataPusher<TData> : DataPusher {
    
    typealias TEntity = TData
    
    var dataPusher: (TEntity?) -> Void
    
    func push(data: TData?) {
        dataPusher(data)
    }
    
    init<TDataPusher: DataPusher>(pusher: TDataPusher) where TDataPusher.TEntity == TData {
        dataPusher = pusher.push
    }
}
