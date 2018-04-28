//
//  PostViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-04-22.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit
import Cosmos

class PostViewController: UITableViewController {

    var place = RPlace()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var ratingField: CosmosView!
    @IBOutlet weak var categoryField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("SettingsViewController viewDidLoad():", place)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        updateModelData()
        
        if segue.identifier == "categorySegue" {
            let destination = segue.destination as! CategoryTableViewController
            destination.place = place
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("SettingsViewController viewDidAppear()")
        updateViewData()
    }
    
    private func updateViewData() {
        print("In updateViewData:", place)
        nameField.text = place.name ?? ""
        authorField.text = place.author ?? ""
        ratingField.rating = place.rating ?? 3.0
        categoryField.text = place.category ?? "Select category"
        print("Rating", place.rating)
        print("Place", place.toJSONString())

    }
 
    private func updateModelData() {
        place.name = nameField.text
        place.author = authorField.text
        place.rating = ratingField.rating
        place.category = categoryField.text
    }
}
