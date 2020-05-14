//
//  Presenter.swift
//  reminder
//
//  Created by Svyatoslav Titov on 07.04.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

protocol Presenter {
    func present(controller: UIViewController?)
    func setAsRoot(_ controller: UIViewController?, isShowBar: Bool)
}
