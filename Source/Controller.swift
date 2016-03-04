//
//  Controller.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class ViewController: UIViewController, BaseControllerType {
    public var obj: BaseViewModelType!
}

public class TableViewController: ViewController, BaseListControllerType, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _obj.numberOfSections()
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return _obj.numberOfItemsInSection(section)
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellInfo = _obj.cellInfoAtIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellInfo.cellType?.reuseIdentifier ?? "", forIndexPath: indexPath)
        if let _cell = cell as? BaseListViewCellType, let BaseCellModelType = cellInfo.BaseCellModelType{
            _cell.bindingCellModel(BaseCellModelType.init(_obj.itemAtIndexPath(indexPath)))
        }
        return cell
    }
}

public class CollectionViewController: ViewController, BaseListControllerType, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _obj.numberOfItemsInSection(section)
    }
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return _obj.numberOfSections()
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellInfo = _obj.cellInfoAtIndexPath(indexPath)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellInfo.cellType?.reuseIdentifier ?? "", forIndexPath: indexPath)
        if let _cell = cell as? BaseListViewCellType, let BaseCellModelType = cellInfo.BaseCellModelType{
            _cell.bindingCellModel(BaseCellModelType.init(_obj.itemAtIndexPath(indexPath)))
        }
        return cell
    }
}
