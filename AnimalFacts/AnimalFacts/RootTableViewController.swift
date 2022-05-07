//
//  RootTableViewController.swift
//  AnimalFacts
//
//  Created by Marco on 5/6/22.
//

import Foundation
import UIKit

//Associate class with UITableViewController by inheritance
class RootTableViewController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //number of sectioned off cells for table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
