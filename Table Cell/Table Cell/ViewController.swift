//
//  ViewController.swift
//  Table Cell
//
//  Created by ldjhust on 15/12/10.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cellTableIdentifier = "CellTableIdentifier"
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"],
        ["Name" : "Mac Mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
    }
}

// MARK: - tableView dataSource

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier) as! NameAndColorCell
        
        cell.name = computers[indexPath.row]["Name"]!
        cell.color = computers[indexPath.row]["Color"]!
        
        return cell
    }
}

// MARK: - tableView delegate

extension ViewController: UITableViewDelegate {
    
}