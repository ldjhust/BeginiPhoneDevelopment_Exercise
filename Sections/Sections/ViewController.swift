//
//  ViewController.swift
//  Sections
//
//  Created by ldjhust on 15/12/10.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    var searchController: UISearchController!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        tableView.sectionIndexBackgroundColor = UIColor.blackColor()
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGrayColor()
        tableView.sectionIndexColor = UIColor.whiteColor()
        
        let filepath = NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
        let nameDic = NSDictionary(contentsOfFile: filepath!)
        names = nameDic as! [String: [String]]
        keys = (nameDic?.allKeys as! [String]).sort()
        
        let resultsController = SearchResultsController()
        resultsController.names = names
        resultsController.keys = keys
        
        searchController = UISearchController(searchResultsController: resultsController)
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[keys[section]]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier)
        
        cell?.textLabel?.text = names[keys[indexPath.section]]![indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print ("o")
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let a1 = UITableViewRowAction(style: .Destructive, title: "shanchu") { (rowAcion, indexPath) -> Void in
            print ("haha, shide zaiwozhe")
        }
        let a2 = UITableViewRowAction(style: .Default, title: "置顶") { (action, indexPath) -> Void in
            print ("\(indexPath.row) 置顶")
        }
        
        a2.backgroundColor = UIColor.blueColor()
        
        return [a1, a2]
    }
}
