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
    
    @Published var totalItemsCount: String?
    
    // MARK: - commands
    public private(set) var addCommand: (() -> ())?
    
    public private(set) var loadCommand: (() -> ())?
    
    // MARK: - properties
    public var title: String?
    public var description: String?
    
    // MARK: - constr and destr
    override init() {
        super.init()
        self.addCommand = add.self
        self.loadCommand = load.self
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
        let remind = Remind(context: dataProvider.persistentContainer.viewContext)
        
        guard let unwrapperTitle = title, let unwrapperDescription = description else {
            return
        }
        
        remind.descriptionText = unwrapperDescription
        remind.title = unwrapperTitle
        
        dataProvider.Save(entity: remind)
    }
    
    private func load(){
        testMethod()
    }
    
    private func onAddNewItem(entity: Remind) -> Void {
        //TODO: reload list
    }
    
    
    private func testMethod() {
        let remindDataProvider = AnyDataProvider<Remind>(provider: self.dataProvider)
        let dataRepository = RemindDataRepository(remindDataProvider)
        
        _ = dataRepository.getAll()
            .subscribe(on: DispatchQueue.global(qos: .background))
            .sink(receiveCompletion: { print($0) }, receiveValue: { self.totalItemsCount = "Count of items: \($0.count)" })
    }
}
