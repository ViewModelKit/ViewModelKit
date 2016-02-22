//
//  SimpleTableView.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class StudentCell: TableViewCell, TableViewCellTypeAddition {
    
    override func objDidSet(obj: ModelType?) {
        setCellModel(obj)
    }
    
    var cellModel: StudentCellModel?
    
    func binding() {
        textLabel?.text = "Student: \(cellModel!.name)"
        detailTextLabel?.text = cellModel?.age
    }
}