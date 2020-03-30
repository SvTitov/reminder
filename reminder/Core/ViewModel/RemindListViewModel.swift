//
//  RemindListViewModel.swift
//  reminder
//
//  Created by Svyatoslav Titov on 22.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit
import Combine

public class RemindListViewModel : BaseViewModel  {
    // MARK: - subscriptions
    var onAddNewItemSub: AnyCancellable?
    
    // MARK: - fields
    private var dataProvider = RemindDataProvider()
    
    // MARK: - commands
    public private(set) var addCommand: (() -> ())?
    
    // MARK: - properties
    public var title: String?
    public var description: String?
    
    // MARK: - constr and destr
    override init() {
        super.init()
        self.addCommand = add.self
        
    }
    
    deinit {
        onAddNewItemSub?.cancel()
    }
    
    // MARK: - overrides
    override func initializeSubscriptions() {
         onAddNewItemSub = dataProvider.onAdd
            .sink(receiveValue: onAddNewItem)
    }
    
    // MARK: - methods
    private func add() {
        let remind = Remind()
        
        guard let unwrapperTitle = title, let unwrapperDescription = description else {
            return
        }
        
        remind.descriptionText = unwrapperDescription
        remind.title = unwrapperTitle
        
        dataProvider.Save(entity: remind)
    }
    
    private func onAddNewItem(entity: Remind) -> Void {
        //TODO: reload list
    }
}
