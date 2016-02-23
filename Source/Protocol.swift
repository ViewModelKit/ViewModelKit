//
//  Protocol.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AutoInitializeType Protocol
public protocol AutoInitializeType {
    
    /// auto initialize
    /// You don't need to call it directly.
    init()
}

// MARK: - ViewModelType Protocol
public protocol ViewModelType: class, AutoInitializeType { }

// MARK: - ArrayModelType Protocol
public protocol ArrayModelType: class, ViewModelType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var objs: [ModelType]? { get set }
    
    /// The method you must override
    func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String
}

extension ArrayModelType {
    
    /// default implement for func numberOfSectionsInTableView(tableView: UITableView) -> Int
    public func numberOfSections() -> Int {
        return 1
    }
    
    /// default implement for func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    public func numberOfItemsInSection(section: Int) -> Int {
        return objs!.count
    }
    
    /// return the item for at indexPath
    public func itemAtIndexPath(indexPath: NSIndexPath) -> ModelType {
        return objs![indexPath.row]
    }
}

// MARK: - Addition Protocol For ArrayModelType
public protocol ArrayModelTypeAddition: ArrayModelType {
    
    typealias T: ModelType
}

extension ArrayModelTypeAddition {
    
    /// Use it directly.
    public var items: [T] {
        get {
            return safeItems()
        }
        set {
            objs = newValue
        }
    }
    
    /// Safety initialization
    private func safeItems() -> [T] {
        if let models = objs {
            return models as! [T]
        } else {
            items = [T]()
            return items
        }
    }
}

// MARK: - CellModelType Protocol
public protocol CellModelType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ModelType? { set get }
    
    init(_ x: ModelType?)
}

// MARK: - Addition Protocol For CellModelType
public protocol CellModelTypeAddition {
    
    typealias T: ModelType
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ModelType? { get set }
}

extension CellModelTypeAddition {
    
    /// Use it directly.
    public var model: T {
        get {
            return obj as! T
        }
        set {
            obj = newValue
        }
    }
}

// MARK: - ViewControllerType Protocol
public protocol ViewControllerType: class {
    
    typealias T: ViewModelType
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ViewModelType! { get set }
}

public extension ViewControllerType {
    
    /// Use it directly.
    public var viewModel: T {
        get {
            return safeViewModel()
        }
        set {
            obj = newValue
        }
    }
    
    /// Safety initialization
    private func safeViewModel() -> T {
        if let safeViewModel = obj {
            return safeViewModel as! T
        } else {
            viewModel = T()
            return viewModel
        }
    }
}

// MARK: - ListViewControllerType Protocol
public protocol ListViewControllerType: class {
    typealias T: ListViewModelType
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ListViewModelType! { get set }
}

extension ListViewControllerType {
    /// Use it directly.
    public var viewModel: T {
        get {
            return safeViewModel()
        }
        set {
            obj = newValue
        }
    }
    
    private func safeViewModel() -> T {
        if let safeViewModel = obj {
            return safeViewModel as! T
        } else {
            viewModel = T()
            return viewModel
        }
    }
}

// MARK: - ListViewCellType Protocol
public protocol ListViewCellType: ClassIdentifier, CellSizeType {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ModelType? { get set }
    
    /// override
    func objDidSet(obj: ModelType?)
}

// MARK: - Addition Protocol For ListViewCellType
public protocol ListViewCellTypeAddition: class {
    
    typealias T: CellModel
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    var obj: ModelType? { get set }
    
    /// Use it directly.
    var cellModel: T? { get set }
    
    /// Override it to bind data
    func binding()
}

extension ListViewCellTypeAddition {
    
    public func setCellModel(o: ModelType?) {
        
        cellModel = T(o)
        
        binding()
    }
}

// MARK: - CellSizeType Protocol
public protocol CellSizeType: class { }

extension CellSizeType {
    
    public var height: Float {
        return 0
    }
    
    public var size: CGSize {
        return CGSizeZero
    }
}

// MARK: - Class Identifier
public protocol ClassIdentifier: class { }

extension ClassIdentifier {
    
    public static var reuseIdentifier: String {
        
        return NSStringFromClass(self).className()
    }
}

extension String {
    
    func className() -> String {
        
        return componentsSeparatedByString(".").last ?? self
    }
}

// MARK: - TableViewControllerType Protocol
public typealias TableViewControllerType = ListViewControllerType

// MARK: - CollectionViewControllerType Protocol
public typealias CollectionViewControllerType = ListViewControllerType

// MARK: - ListViewModelType Protocol
public typealias ListViewModelType = ArrayModelType

// MARK: - Addition Protocol For ListViewModelType
public typealias ListViewModelTypeAddition = ArrayModelTypeAddition

// MARK: - TableViewModelType Protocol
public typealias TableViewModelType = ListViewModelType
// MARK: - CollectionViewModelType Protocol
public typealias CollectionViewModelType = ListViewModelType

// MARK: - Addition Protocol For TableViewModelType
public typealias TableViewModelTypeAddition = ListViewModelTypeAddition

// MARK: - Addition Protocol For CollectionViewModelType
public typealias CollectionViewModelTypeAddition = ListViewModelTypeAddition

// MARK: - TableViewCellType Protocol
public typealias TableViewCellType = ListViewCellType

// MARK: - Addition Protocol For TableViewCellType
public typealias TableViewCellTypeAddition = ListViewCellTypeAddition

// MARK: - CollectionViewCellType Protocol
public typealias CollectionViewCellType = ListViewCellType

// MARK: - Addition Protocol For CollectionViewCellType
public typealias CollectionViewCellTypeAddition = ListViewCellTypeAddition