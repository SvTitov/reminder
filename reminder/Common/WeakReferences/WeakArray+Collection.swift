//
//  WeakArray.swift
//  reminder
//
//  Created by Svyatoslav Titov on 06.06.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

public struct WeakArray<TType: AnyObject> {
    private var items: [WeakRef<TType>] = []
    
    init(_ elements: [TType]) {
        self.items = elements.map { WeakRef($0) }
    }
}

extension WeakArray: Collection {
    public func index(after i: Int) -> Int { items.index(after: i) }
    
    public subscript(position: Int) -> TType? { items[position].value }
    
    public var startIndex: Int {
        return items.startIndex
    }
    
    public var endIndex: Int {
        return items.endIndex
    }
}
