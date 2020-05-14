//
//  ViewControllerExtensions.swift
//  reminder
//
//  Created by Svyatoslav Titov on 14.05.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func initFromStoryboard(_ storyboardName: Storyboards) -> Self{
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
