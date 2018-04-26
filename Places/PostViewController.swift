//
//  PostViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-04-22.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {

    var data: RPlace!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("SettingsViewController viewDidLoad():", data)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nameSegue" {
            let destination = segue.destination as! PostViewController // Change to the child view controller
            destination.data = data
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("SettingsViewController viewDidAppear()")
        updateViewData()
    }
    
    private func updateViewData() {
        print("In updateViewData:", data)
    }
}
