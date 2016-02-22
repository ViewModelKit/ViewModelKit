//
//  IntricateTableView.swift
//  Example
//
//  Created by Tongtong Xu on 16/2/22.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class TeacherCell: TableViewCell, TableViewCellTypeAddition {
    
    override func objDidSet(obj: ModelType?) {
        setCellModel(obj)
    }
    
    var cellModel: TeacherCellModel?
    
    func binding() {
        textLabel?.text = "Teacher: \(cellModel!.name)"
        detailTextLabel?.text = cellModel?.age
    }
}