//
//  Protocol.swift
//  SimpleViewModel
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

///------------------------------------------------------------------------------------------------

public typealias AutoInitializeViewModelType = protocol<ViewModelType,AutoInitialization>

///------------------------------------------------------------------------------------------------

public protocol AutoInitialization {
    init()
}

///------------------------------------------------------------------------------------------------

public protocol ModelType {
    
}

///------------------------------------------------------------------------------------------------

public protocol ViewModelType {
    
}

///------------------------------------------------------------------------------------------------

public protocol ListViewModelType: class, ViewModelType {
    
    var objs: [ModelType] { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItemsInSection(section: Int) -> Int
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> ModelType
    
    func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: ClassIdentifier.Type?, cellModelType: CellModelType.Type?)
}

///------------------------------------------------------------------------------------------------

public protocol ListViewModelTypeAddition {
    
    typealias T: ModelType
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
    
    init(_ x: ModelType)
}

///------------------------------------------------------------------------------------------------

public protocol CellModelTypeAddition {
    
    typealias T: ModelType
}

public extension CellModelTypeAddition where Self: CellModelType{
    
    var model: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

public protocol ControllerType: class {
    
    var obj: ViewModelType! { get set }
}

///------------------------------------------------------------------------------------------------

public protocol ControllerTypeAddition: class {
    
    typealias T: AutoInitializeViewModelType
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
}

public extension ListViewCellTypeAddition where Self: ListViewCellType {
    
    var cellModel: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

private class ListViewModelPlaceholder: ListViewModelType {
    
    var objs: [ModelType] = []
    
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
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> ModelType {
        return objs[indexPath.row]
    }
    
    func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: ClassIdentifier.Type?, cellModelType: CellModelType.Type?) {
        return (nil, nil)
    }
}

///------------------------------------------------------------------------------------------------

public protocol ClassIdentifier: class {
    
    static var reuseIdentifier: String { get }
}

extension ClassIdentifier {
    
    public static var reuseIdentifier: String {
        
        return String(self)
    }
}
