//
//  ApplicationCoordinator.swift
//  reminder
//
//  Created by Svyatoslav Titov on 07.04.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

public class ApplicationCoordinator : Coordinator {
    
    var childs : [Coordinator] = []
    
    private var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    func start() {
        self.presenter.setAsRoot(RemindListViewController.initFromStoryboard(.main), isShowBar: true)
    }
    
    func start(with option: NSObject?) {
        
    }
    
    
}
