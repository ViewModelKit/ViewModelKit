//
//  SimpleTableView.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class StudentCell: TableViewCell, BaseListViewCellTypeAddition {
    
    typealias T = StudentCellModel

    override func cellModelValid() {
        textLabel?.text = "Student: \(cellModel.name)"
        detailTextLabel?.text = cellModel.age
    }
}