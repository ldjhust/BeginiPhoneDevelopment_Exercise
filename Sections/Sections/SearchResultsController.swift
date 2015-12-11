//
//  SearchResultsController.swift
//  Sections
//
//  Created by ldjhust on 15/12/11.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

private let longNameSize = 6
private let shortNamesButtonIndex = 1
private let longNamesButtonIndex = 2

class SearchResultsController: UITableViewController, UISearchResultsUpdating {
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names = [String: [String]]()
    var keys = [String]()
    var filteredNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }
    
    // MARK: - UISearchResultsUpdating Conformance
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
        filteredNames.removeAll(keepCapacity: true)
        
        if searchString != nil && !searchString!.isEmpty {
            let filter: String -> Bool = { name in
                let nameLength = name.characters.count
                if (buttonIndex == shortNamesButtonIndex && nameLength >= longNameSize)
                    || (buttonIndex == longNamesButtonIndex && nameLength < longNameSize) {
                        return false
                }
                
                let range = name.rangeOfString(searchString!, options: .CaseInsensitiveSearch)
                
                return range != nil
            }
            
            for key in keys {
                let namesForKey = names[key]
                let matchs = namesForKey?.filter(filter)
                filteredNames += matchs!
            }
        }
        
        tableView.reloadData()
    }
    
    // MARK: - UITableView DataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: sectionsTableIdentifier)
        }
        
        cell?.textLabel?.text = filteredNames[indexPath.row]
        
        return cell!
    }
}
