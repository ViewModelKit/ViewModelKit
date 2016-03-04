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

class IntricateTableViewModel: BaseListViewModel<Model> {
    
    required init() {
    }

    override func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: BaseClassIdentifier.Type?, cellType: BaseCellModelType.Type?) {
        if itemAtIndexPath(indexPath) is Teacher {
            return (TeacherCell.self, TeacherCellModel.self)
        } else {
            return (StudentCell.self,StudentCellModel.self)
        }
    }
}

class TeacherCellModel: BaseListViewCellModel<Teacher> {
        
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

class Teacher: Model {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}