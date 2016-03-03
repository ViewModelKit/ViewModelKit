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

class IntricateTableViewController: TableViewController, ControllerTypeAddition {
    
    typealias T = IntricateTableViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sss = teachers.map{ JSON($0) }.map(Teacher.init).map{ TeacherCellModel($0) } + students.map{JSON($0)}.map(Student.init).map{ StudentCellModel($0) }
        viewModel.items = sss
    }
}