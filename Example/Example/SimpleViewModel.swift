//
//  SimpleViewModel.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import ViewModelKit

class SimpleViewModel: AutoInitializeViewModelType {
    
    let nameTitle: String
    
    var name: String = "" {
        didSet {
            errorMessage = name.length > 5 ? "不能输入超过5个字符" : ""
        }
    }
    
    var errorMessage = "" {
        didSet {
            validClosure?(errorMessage)
        }
    }
    
    var validClosure: ((String) -> ())?
    
    required init() {
        nameTitle = "用户名"
    }
}

extension String {
    
    var length: Int {
        return characters.count
    }
}