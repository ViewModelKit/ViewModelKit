//
//  Bridge.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/23.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import UIKit

public protocol BridgeType {
    
    var obj: ViewModelType! { get set }
}

public protocol BridgeTypeAddition: class {
    
    typealias O: BridgeType

    var bridge: O { get set }
    
    typealias T: ViewModelType
}

extension BridgeTypeAddition {
    
    public var viewModel: T {
        get {
            return safeObj()
        }
        set {
            bridge.obj = newValue
        }
    }
    
    /// Safety initialization
    private func safeObj() -> T {
        if let safeObj = bridge.obj as? T {
            return safeObj
        } else {
            viewModel = T()
            return viewModel
        }
    }
}

public class Bridge: BridgeType {
    
    public var obj: ViewModelType!
}

/*

class A: UIViewController {
    
    var bridge = Bridge()
}

class B: A, BridgeTypeAddition {
    typealias T = BVM
    
    func test() {
        
    }
}

class BVM: ViewModelType {
    
    required init() { }
    
    func test() {
        
    }
}

class C: A, BridgeTypeAddition {
    
    typealias T = CVM
    
    func test() {
        
    }
}

class CVM: TableViewModel<CM> {
    required init() {
        super.init()
    }
}

class CM: ModelType {
    
}

*/