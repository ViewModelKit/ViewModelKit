//
//  IntricateTableViewController.swift
//  Example
//
//  Created by Tongtong Xu on 16/2/22.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit
import SwiftyJSON

class IntricateTableViewController: BaseTableViewController, BaseControllerTypeAddition {
    
    typealias T = IntricateTableViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.items = teachers.map{ JSON($0) }.map(Teacher.init) + students.map{JSON($0)}.map(Student.init)
    }
}