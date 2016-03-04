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
    
    override func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: BaseClassIdentifier.Type?, cellType: BaseCellModelType.Type?) {
        return (StudentCell.self,StudentCellModel.self)
    }
}

class StudentCellModel: ListViewCellModel<Student> {
    
    var name: String {
        return model.name
    }
    
    var age: String {
        return "\(model.age)岁"
    }
    
    required init(_ x: BaseModelType) {
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