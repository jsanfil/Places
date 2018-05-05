//
//  SharingTableViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-04-27.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class SharingTableViewController: UITableViewController {
 
    // Sharing
    let sharingList = ["private", "friends", "public"]
    
    // data shared between viewControllers
    var place: RPlace?
    
    // The row that was selected when we first enter the screen. Could be nil
    var selectedIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return sharingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SharingTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SharingTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SharingTableViewCell.")
        }
        
        // Fill in the table with the category labels
        cell.sharingLabel.text = sharingList[indexPath.row]
        if place?.access == sharingList[indexPath.row] {
            cell.accessoryType = .checkmark
            selectedIndex = indexPath
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell \(indexPath.row)")
        var cell: UITableViewCell?
        
        if let index = selectedIndex {
            cell = tableView.cellForRow(at: index)
            cell?.accessoryType = .none
        }
        cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        selectedIndex = indexPath
        place?.access = sharingList[indexPath.row]
        navigationController?.popViewController(animated: true)
    }
    
}
