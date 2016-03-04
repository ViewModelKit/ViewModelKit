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

class SimpleTableViewController: TableViewController, ControllerTypeAddition {
    
    typealias T = SimpleTableViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.items = students.map{JSON($0)}.map(Student.init)
    }
}