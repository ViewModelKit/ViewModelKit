//
//  Protocol.swift
//  SimpleViewModel
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public typealias AutoInitializeViewModelType = protocol<ModelType,AutoInitialization>

///------------------------------------------------------------------------------------------------

public protocol AutoInitialization {
    init()
}

///------------------------------------------------------------------------------------------------

public protocol ModelType {
    
}

///------------------------------------------------------------------------------------------------

public protocol ListViewModelType: class, ModelType {
    
    var objs: [CellModelType] { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItemsInSection(section: Int) -> Int
    
    func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String
    
    func cellModelAtIndexPath(indexPath: NSIndexPath) -> CellModelType
}

///------------------------------------------------------------------------------------------------

public protocol ListViewModelTypeAddition: class {
    
    typealias T: CellModelType
    
    var items: [T] { get set }
}

public extension ListViewModelTypeAddition where Self: ListViewModelType {
    
    var items: [T] {
        get {
            return safeObjs
        }
        set {
            objs = newValue.map{ $0 }
        }
    }
    
    private var safeObjs: [T] {
        if let _objs = objs as? [T] {
            return _objs
        }
        objs = []
        return self.safeObjs
    }
}

///------------------------------------------------------------------------------------------------

public protocol CellModelType: class {
    
    var obj: ModelType! { get set }    
}

///------------------------------------------------------------------------------------------------

public protocol CellModelTypeAddition {
    
    typealias T: ModelType
    
    var model: T { get }
}

public extension CellModelTypeAddition where Self: CellModelType{
    
    var model: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

public protocol ControllerType: class {
    
    var obj: ModelType! { get set }
}

///------------------------------------------------------------------------------------------------

public protocol ControllerTypeAddition {
    
    typealias T: AutoInitializeViewModelType
    
    var viewModel: T { get set }
}

public extension ControllerTypeAddition where Self: ControllerType {
    
    var viewModel: T {
        get {
            return safeObj
        }
        set {
            obj = newValue
        }
    }
    
    private var safeObj: T {
        if let _obj = obj as? T {
            return _obj
        }
        obj = T()
        return self.safeObj
    }
}

///------------------------------------------------------------------------------------------------

public protocol ListControllerType {
    
    var _obj: ListViewModelType! { get set }
}

public extension ListControllerType where Self: ControllerType {
    
    var _obj: ListViewModelType! {
        get {
            return _safeObj
        }
        set {
            obj = newValue
        }
    }
    
    private var _safeObj: ListViewModelType {
        if let __obj = obj as? ListViewModelType {
            return __obj
        }
        return ListViewModelPlaceholder()
    }
}

///------------------------------------------------------------------------------------------------

public protocol ListViewCellType: class {
    
    var obj: CellModelType! { get set }
    
    func bindingCellModel(cellModel: CellModelType)
}

///------------------------------------------------------------------------------------------------

public protocol ListViewCellTypeAddition {
    
    typealias T: CellModelType
    
    var cellModel: T { get }
}

public extension ListViewCellTypeAddition where Self: ListViewCellType {
    
    var cellModel: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

private class ListViewModelPlaceholder: ListViewModelType {
    
    var objs: [CellModelType] = []

    required init() { }
    
    func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return ""
    }
    
    func numberOfSections() -> Int {
        return 0
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return objs.count
    }
    
    func cellModelAtIndexPath(indexPath: NSIndexPath) -> CellModelType {
        return objs[indexPath.row]
    }
}
