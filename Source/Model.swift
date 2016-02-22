//
//  Model.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

// MARK: - ModelType Class
public class ModelType {
    
    public init() { }
}

public class TableViewModel: TableViewModelType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var objs: [ModelType]? = [ModelType]()
    
    /// You don't need to call it directly.
    public required init() { }
    
    /// The method you must override to return cell identifier
    ///
    ///     return TableViewCell.reuseIdentifier
    public func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return TableViewCell.reuseIdentifier
    }
}

public class CollectionViewModel: CollectionViewModelType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var objs: [ModelType]? = [ModelType]()
    
    /// You don't need to call it directly.
    public required init() { }
    
    /// The method you must override to return cell identifier
    ///
    ///     return CollectionViewCell.reuseIdentifier
    public func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return CollectionViewCell.reuseIdentifier
    }
}

public class CellModel: CellModelType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: ModelType?
    
    /// Assign obj. You don't need to override or call it generally.
    public required init(_ x: ModelType?) {
        obj = x
    }
}