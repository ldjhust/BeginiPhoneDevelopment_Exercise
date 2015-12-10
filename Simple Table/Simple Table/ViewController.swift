//
//  ViewController.swift
//  Simple Table
//
//  Created by ldjhust on 15/12/10.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

private let simpleTableIdentiful = "SimpleTableIdentifier"

class ViewController: UIViewController {
    private let dwarves = ["Sleepy", "Sneezy", "Bashful", "Happy",
                           "Doc", "Grumpy", "Dopey", "Thorin",
                           "Dorin", "Nori", "Ori", "Balin",
                           "Dwalin", "Fili", "Kili", "Oin", "Gloin",
                           "Bifur", "Bofur", "Bombur"]
}

// MARK: - tableview datasource

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentiful)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: simpleTableIdentiful)
        }
        
        let img = UIImage(named: "star")
        cell!.textLabel?.font = UIFont.boldSystemFontOfSize(50)
        cell!.textLabel?.text = dwarves[indexPath.row]
        cell!.imageView?.image = img
        
        return cell!
    }
}

// MARK: - tableview delegate

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.row == 0 {
            return nil
        }else if indexPath.row % 2 == 0 {
            return NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        }else {
            return indexPath
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        let alert = UIAlertController(title: "Row Selected", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yes, I did", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
}

