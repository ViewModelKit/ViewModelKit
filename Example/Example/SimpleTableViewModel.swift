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

class SimpleTableViewModel: ListViewModel<StudentCellModel> {
    
    required init() {
    }

    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return "StudentCell"
    }
}

class StudentCellModel: TableViewCellModel<Student> {
    
    typealias T = Student
    
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

class Student: ModelType {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}