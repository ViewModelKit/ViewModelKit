//
//  Model.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class ViewModel: ModelType, AutoInitialization {
    
    public required init() { }
}

public class ListViewModel<Model: ModelType>: ListViewModelType, ListViewModelTypeAddition, AutoInitialization {
    
    public var objs: [ModelType] = []
    
    public typealias T = Model
    
    public required init() { }
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfItemsInSection(section: Int) -> Int {
        return objs.count
    }
    
    public func itemAtIndexPath(indexPath: NSIndexPath) -> ModelType {
        return objs[indexPath.row]
    }
    
    public func cellInfoAtIndexPath(indexPath: NSIndexPath) -> (cellType: ClassIdentifier.Type?, cellModelType: CellModelType.Type?) {
        return (nil, nil)
    }
}

public class CellModel: CellModelType {
    
    public var obj: ModelType!
    
    public required init(_ x: ModelType) {
        obj = x
        modelValid()
    }
    
    public func modelValid() {
        
    }
}

public class ListViewCellModel<Element: ModelType>: CellModel, CellModelTypeAddition {
    
    public typealias T = Element
    
    public required init(_ x: ModelType) {
        
       super.init(x)
        
    }
}