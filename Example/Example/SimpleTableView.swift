//
//  SimpleTableView.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class UserCell: TableViewCell, TableViewCellTypeAddition {
    
    override func objDidSet(obj: ModelType?) {
        setCellModel(obj)
    }
    
    var cellModel: UserCellModel?
    
    func binding() {
        textLabel?.text = cellModel?.name
        detailTextLabel?.text = cellModel?.age
    }
}