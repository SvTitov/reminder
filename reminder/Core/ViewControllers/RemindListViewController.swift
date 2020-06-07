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
    
    @IBOutlet weak var totalLabel: UILabel!
    
    private var changeStream: AnyCancellable?
    
    private var viewModel: RemindListViewModel? = RemindListViewModel()
    
    @IBAction func onSaveClick(_ sender: Any) {
        viewModel?.addCommand!()
    }
    
    @IBAction func onLoadClick(_ sender: Any) {
        viewModel?.loadCommand!()
    }
    
    @IBAction func onTitleChange(_ sender: Any) {
        if let textField = sender as? UITextField {
            viewModel?.title = textField.text!
        }
    }
    @IBAction func onDescriptionChange(_ sender: Any) {
        if let textField = sender as? UITextField {
            viewModel?.description = textField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         changeStream = viewModel?.$totalItemsCount
            .receive(on: RunLoop.main)
            .assign(to: \.text, on: totalLabel)
    }
    
    private func saveItem(title: String, description: String) -> Void {
        
    }
}
