//
//  Coordinator.swift
//  reminder
//
//  Created by Svyatoslav Titov on 05.04.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation

protocol Coordinator {
    func start()
    func start(with option: NSObject?)
}
