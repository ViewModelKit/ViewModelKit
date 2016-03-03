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

public class ListViewModel<Element: CellModelType>: ListViewModelType, ListViewModelTypeAddition, AutoInitialization {
    
    public var objs: [CellModelType] = []
    
    public typealias T = Element
    
    public required init() { }
    
    public func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return ""
    }
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfItemsInSection(section: Int) -> Int {
        return objs.count
    }
    
    public func cellModelAtIndexPath(indexPath: NSIndexPath) -> CellModelType {
        return objs[indexPath.row]
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

public class TableViewCellModel<Element: ModelType>: CellModel, CellModelTypeAddition {
    
    public typealias T = Element
    
    public required init(_ x: ModelType) {
       super.init(x)
    }
}