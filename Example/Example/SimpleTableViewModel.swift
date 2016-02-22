//
//  SimpleTableViewModel.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit
import SwiftyJSON

class SimpleTableViewModel: TableViewModel<Student> {
    
    required init() {
        super.init()
    }

    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return StudentCell.reuseIdentifier
    }
}

class StudentCellModel: CellModel, CellModelTypeAddition {
    
    typealias T = Student
    
    var name: String {
        return model.name
    }
    
    var age: String {
        return "\(model.age)岁"
    }
}

class Student: ModelType {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}