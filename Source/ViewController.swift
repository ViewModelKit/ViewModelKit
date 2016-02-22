//
//  ViewController.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: ViewModelType!
}

public class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: TableViewModelType!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.estimatedRowHeight = tableView?.rowHeight ?? 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
    }
    
    deinit {
        tableView?.delegate = nil
        tableView?.dataSource = nil
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// You don't need to override it generally.
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return obj.numberOfSections()
    }
    
    /// You don't need to override it generally.
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj.numberOfItemsInSection(section)
    }
    
    /// You don't need to override it generally.
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(obj.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath) as! TableViewCell
        cell.obj = obj.itemAtIndexPath(indexPath)
        return cell
    }
}

public class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// It's bridge variable, you'd better not use it directly.
    /// But you can use it in your "Addition" protocol to design your property.
    public var obj: CollectionViewModelType!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    deinit {
        collectionView?.delegate = nil
        collectionView?.dataSource = nil
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    /// You don't need to override it generally.
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return obj.numberOfSections()
    }
    
    /// You don't need to override it generally.
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obj.numberOfItemsInSection(section)
    }
    
    /// You don't need to override it generally.
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(obj.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath) as! CollectionViewCell
        cell.obj = obj.itemAtIndexPath(indexPath)
        return cell
    }
}

