//
//  IntricateTableView.swift
//  Example
//
//  Created by Tongtong Xu on 16/2/22.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class TeacherCell: BaseTableViewCell, BaseListViewCellTypeAddition {
    
    typealias T = TeacherCellModel

    override func cellModelValid() {
        textLabel?.text = "Teacher: \(cellModel.name)"
        detailTextLabel?.text = cellModel.age
    }
}