//
//  Model.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class BaseViewModel: BaseModelType, BaseAutoInitialization {
    
    public required init() { }
}

public class BaseListViewModel<Model: BaseModelType>: BaseListViewModelType, BaseListViewModelTypeAddition, BaseAutoInitialization {
    
    public var objs: [BaseModelType] = []
    
    public typealias T = Model
    
    public required init() { }
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfItemsInSection(section: Int) -> Int {
        return objs.count
    }
    
    public func itemAtIndexPath(indexPath: NSIndexPath) -> BaseModelType {
        return objs[indexPath.row]
    }
    
    public func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: BaseClassIdentifier.Type?, BaseCellModelType: BaseCellModelType.Type?) {
        return (nil, nil)
    }
}

public class BaseCellModel: BaseCellModelType {
    
    public var obj: BaseModelType!
    
    public required init(_ x: BaseModelType) {
        obj = x
        modelValid()
    }
    
    public func modelValid() {
        
    }
}

public class BaseListViewCellModel<Element: BaseModelType>: BaseCellModel, BaseCellModelTypeAddition {
    
    public typealias T = Element
    
    public required init(_ x: BaseModelType) {
        
       super.init(x)
        
    }
}