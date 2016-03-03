//
//  Controller.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/3/3.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation

public class ViewController: UIViewController, ControllerType {
    public var obj: ModelType!
}

public class TableViewController: ViewController, ListControllerType, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _obj.numberOfSections()
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return _obj.numberOfItemsInSection(section)
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(_obj.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath)
        if let _cell = cell as? ListViewCellType {
            _cell.bindingCellModel(_obj.cellModelAtIndexPath(indexPath))
        }
        return cell
    }
}
