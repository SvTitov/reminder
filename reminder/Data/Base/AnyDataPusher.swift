//
//  AnyDataPusher.swift
//  reminder
//
//  Created by Svyatoslav Titov on 29.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

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
