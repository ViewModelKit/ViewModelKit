//
//  ViewController.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    public var bridge = Bridge()
}

public class TableViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    private var tableViewModel: TableViewModelType {
        return (bridge.obj as! TableViewModelType)
    }
    
    /// You don't need to override it generally.
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewModel.numberOfSections()
    }
    
    /// You don't need to override it generally.
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.numberOfItemsInSection(section)
    }
    
    /// You don't need to override it generally.
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableViewModel.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath) as! TableViewCell
        cell.obj = tableViewModel.itemAtIndexPath(indexPath)
        return cell
    }
}

public class CollectionViewController: ViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    private var collectionViewModel: CollectionViewModelType {
        return (bridge.obj as! CollectionViewModelType)
    }
    
    /// You don't need to override it generally.
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return collectionViewModel.numberOfSections()
    }
    
    /// You don't need to override it generally.
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.numberOfItemsInSection(section)
    }
    
    /// You don't need to override it generally.
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewModel.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath) as! CollectionViewCell
        cell.obj = collectionViewModel.itemAtIndexPath(indexPath)
        return cell
    }
}

