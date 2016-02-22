//
//  SimpleTableViewController.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import UIKit
import ViewModelKit
import SwiftyJSON

class SimpleTableViewController: TableViewController, TableViewControllerType {
    
    typealias T = SimpleTableViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.items = products.map{JSON($0)}.map(User.init)
    }
}