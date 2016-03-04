//
//  View.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class TableViewCell: UITableViewCell, BaseListViewCellType, BaseClassIdentifier {
    
    public var obj: BaseCellModelType!
    
    public func bindingCellModel(cellModel: BaseCellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}

public class CollectionViewCell: UICollectionViewCell, BaseListViewCellType, BaseClassIdentifier {
    
    public var obj: BaseCellModelType!
    
    public func bindingCellModel(cellModel: BaseCellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}