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

class SimpleTableViewModel: TableViewModel, TableViewModelTypeAddition {
    
    typealias T = User
    
    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return UserCell.reuseIdentifier
    }
}

class UserCellModel: CellModel, CellModelTypeAddition {
    
    typealias T = User
    
    var name: String {
        return model.name
    }
    
    var age: String {
        return "\(model.age)岁"
    }
}

class User: ModelType {
    let name: String
    let age: Int
    init(_ x: JSON) {
        name = x["name"].stringValue
        age = x["age"].intValue
    }
}