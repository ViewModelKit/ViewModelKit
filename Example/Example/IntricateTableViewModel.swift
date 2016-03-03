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

class IntricateTableViewModel: ListViewModel<CellModel> {
    
    required init() {
    }

    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        if cellModelAtIndexPath(indexPath) is TeacherCellModel {
            return "TeacherCell"
        } else {
            return "StudentCell"
        }
    }
}

class TeacherCellModel: TableViewCellModel<Teacher> {
    
    typealias T = Teacher
    
    var name: String {
        return model.name
    }
    
    var age: String {
        return "\(model.age)岁"
    }
    
    required init(_ x: ModelType) {
        super.init(x)
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