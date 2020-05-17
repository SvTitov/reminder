//
//  DataPublisher.swift
//  reminder
//
//  Created by Svyatoslav Titov on 17.05.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import Combine

public class DataPublisher<TType> : Publisher where TType : Any {
    
    private var data : TType?
    
    public typealias Output = TType
    
    public typealias Failure = Error
    
    init(_ data: TType?) {
        self.data = data
    }
    
    public func receive<S>(subscriber: S) where S : Subscriber, DataPublisher.Failure == S.Failure, DataPublisher.Output == S.Input {
        if let data = data {
            _ = subscriber.receive(data)
        } else {
            //TODO think
        }
    }
    
}
