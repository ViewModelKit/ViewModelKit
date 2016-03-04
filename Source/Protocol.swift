//
//  Protocol.swift
//  SimpleViewModel
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

///------------------------------------------------------------------------------------------------

public typealias BaseAutoInitializeViewModelType = protocol<BaseViewModelType,BaseAutoInitialization>

///------------------------------------------------------------------------------------------------

public protocol BaseAutoInitialization {
    init()
}

///------------------------------------------------------------------------------------------------

public protocol BaseModelType {
    
}

///------------------------------------------------------------------------------------------------

public protocol BaseViewModelType {
    
}

///------------------------------------------------------------------------------------------------

public protocol BaseListViewModelType: class, BaseViewModelType {
    
    var objs: [BaseModelType] { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItemsInSection(section: Int) -> Int
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> BaseModelType
    
    func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: BaseClassIdentifier.Type?, BaseCellModelType: BaseCellModelType.Type?)
}

///------------------------------------------------------------------------------------------------

public protocol BaseListViewModelTypeAddition: class {
    
    typealias T: BaseModelType
}

public extension BaseListViewModelTypeAddition where Self: BaseListViewModelType {
    
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

public protocol BaseCellModelType: class {
    
    var obj: BaseModelType! { get set }
    
    init(_ x: BaseModelType)
}

///------------------------------------------------------------------------------------------------

public protocol BaseCellModelTypeAddition {
    
    typealias T: BaseModelType
}

public extension BaseCellModelTypeAddition where Self: BaseCellModelType{
    
    var model: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

public protocol BaseControllerType: class {
    
    var obj: BaseViewModelType! { get set }
}

///------------------------------------------------------------------------------------------------

public protocol BaseControllerTypeAddition: class {
    
    typealias T: BaseAutoInitializeViewModelType
}

public extension BaseControllerTypeAddition where Self: BaseControllerType {
    
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

public protocol BaseListControllerType {
    
    var _obj: BaseListViewModelType! { get set }
}

public extension BaseListControllerType where Self: BaseControllerType {
    
    var _obj: BaseListViewModelType! {
        get {
            return _safeObj
        }
        set {
            obj = newValue
        }
    }
    
    private var _safeObj: BaseListViewModelType {
        if let __obj = obj as? BaseListViewModelType {
            return __obj
        }
        return ListViewModelPlaceholder()
    }
}

///------------------------------------------------------------------------------------------------

public protocol BaseListViewCellType: class {
    
    var obj: BaseCellModelType! { get set }
    
    func bindingCellModel(cellModel: BaseCellModelType)
}

///------------------------------------------------------------------------------------------------

public protocol BaseListViewCellTypeAddition {
    
    typealias T: BaseCellModelType
}

public extension BaseListViewCellTypeAddition where Self: BaseListViewCellType {
    
    var cellModel: T {
        return obj as! T
    }
}

///------------------------------------------------------------------------------------------------

private class ListViewModelPlaceholder: BaseListViewModelType {
    
    var objs: [BaseModelType] = []
    
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
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> BaseModelType {
        return objs[indexPath.row]
    }
    
    func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: BaseClassIdentifier.Type?, BaseCellModelType: BaseCellModelType.Type?) {
        return (nil, nil)
    }
}

///------------------------------------------------------------------------------------------------

public protocol BaseClassIdentifier: class {
    
    static var reuseIdentifier: String { get }
}

extension BaseClassIdentifier {
    
    public static var reuseIdentifier: String {
        
        return String(self)
    }
}
