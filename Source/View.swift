//
//  View.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import UIKit

public class TableViewCell: UITableViewCell, ClassIdentifier, TableViewCellType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: ModelType? {
        
        didSet {
            objDidSet(obj)
        }
    }
    
    /// Subclass should confirm to TableViewCellTypeAddition Protocol
    ///
    /// Then override it with the follow form
    ///
    ///     override func objDidSet(obj: ModelType?) {
    ///         setCellModel(obj)
    ///     }
    ///
    public func objDidSet(obj: ModelType?) {
        
    }
}

public class CollectionViewCell: UICollectionViewCell, ClassIdentifier, CollectionViewCellType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: ModelType? {
        
        didSet {
            objDidSet(obj)
        }
    }
    
    /// Subclass should confirm to TableViewCellTypeAddition Protocol
    ///
    /// Then override it with the follow form
    ///
    ///     override func objDidSet(obj: ModelType?) {
    ///         setCellModel(obj)
    ///     }
    ///
    public func objDidSet(obj: ModelType?) {
        
    }
}