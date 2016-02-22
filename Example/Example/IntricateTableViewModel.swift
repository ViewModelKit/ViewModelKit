//
//  IntricateTableViewModel.swift
//  Example
//
//  Created by Tongtong Xu on 16/2/22.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit
import SwiftyJSON

class IntricateTableViewModel: TableViewModel<ModelType> {
    
    required init() {
        super.init()
    }

    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        if itemAtIndexPath(indexPath) is Teacher {
            return TeacherCell.reuseIdentifier
        }
        return StudentCell.reuseIdentifier
    }
}

class TeacherCellModel: CellModel, CellModelTypeAddition {
    
    typealias T = Teacher
    
    var name: String {
        return model.name
    }
    
    var age: String {
        return "\(model.age)岁"
    }
}

class Teacher: ModelType {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}