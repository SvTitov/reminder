//
//  RemindItemSource.swift
//  reminder
//
//  Created by Svyatoslav Titov on 28.03.2020.
//  Copyright © 2020 Svyatoslav Titov. All rights reserved.
//

import Foundation
import UIKit

public class RemindItemSource : NSObject, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // TODO: Update with tablewview
           return 0;
       }
       
       public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           return UITableViewCell()
       }
}
