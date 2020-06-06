//
//  WeakRef.swift
//  reminder
//
//  Created by Svyatoslav Titov on 06.06.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

public final class WeakRef<TType: AnyObject> {
    public private(set) weak var value: TType?
    
    init(_ inst:TType) {
        value = inst
    }
}
