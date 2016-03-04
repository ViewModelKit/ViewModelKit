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

class SimpleTableViewModel: ListViewModel<Student> {
    
    required init() {
        
    }
    
    override func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: ClassIdentifier.Type?, cellType: CellModelType.Type?) {
        return (StudentCell.self,StudentCellModel.self)
    }
}

class StudentCellModel: TableViewCellModel<Student> {
    
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

class Student: Model {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}