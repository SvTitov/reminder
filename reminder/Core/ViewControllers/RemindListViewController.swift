//
//  RemindListViewController.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import UIKit
import Combine

class RemindListViewController: UIViewController {
    
    var dataPusher : AnyDataPusher<Remind>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func saveItem(title: String, description: String) -> Void {
        
    }
}
