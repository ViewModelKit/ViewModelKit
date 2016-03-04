//
//  View.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class TableViewCell: UITableViewCell, ListViewCellType, ClassIdentifier {
    
    public var obj: CellModelType!
    
    public func bindingCellModel(cellModel: CellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}

public class CollectionViewCell: UICollectionViewCell, ListViewCellType, ClassIdentifier {
    
    public var obj: CellModelType!
    
    public func bindingCellModel(cellModel: CellModelType) {
        obj = cellModel
        cellModelValid()
    }
    
    public func cellModelValid() {
        
    }
}