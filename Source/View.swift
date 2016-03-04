//
//  View.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class BaseTableViewCell: UITableViewCell, BaseListViewCellType, BaseClassIdentifier {
    
    public var obj: BaseCellModelType!
    
    public func bindingCellModel(cellModel: BaseCellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}

public class BaseCollectionViewCell: UICollectionViewCell, BaseListViewCellType, BaseClassIdentifier {
    
    public var obj: BaseCellModelType!
    
    public func bindingCellModel(cellModel: BaseCellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}