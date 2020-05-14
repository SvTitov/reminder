//
//  ApplicationPresenter.swift
//  reminder
//
//  Created by Svyatoslav Titov on 07.04.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

public class ApplicationPresenter : Presenter {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController;
    }
    
    public func setAsRoot(_ controller: UIViewController?, isShowBar: Bool){
        guard let controller = controller else {
            return
        }
        
        self.navigationController.setViewControllers([controller], animated: true)
        self.navigationController.isNavigationBarHidden = !isShowBar
    }
    
    public func present(controller: UIViewController?){
        guard let controller = controller else {
            return
        }
        
        self.navigationController.pushViewController(controller, animated: true)
    }
}
