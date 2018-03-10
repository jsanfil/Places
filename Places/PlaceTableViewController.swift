//
//  PlaceTableViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-03-07.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit
import os

class PlaceTableViewController: UITableViewController {

    //MARK: Properties
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlaceTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlaceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PlaceTableViewCell.")
        }

        // Fetches the appropriate place for the data source layout.
        let place = places[indexPath.row]

        cell.nameLabel.text = place.name
        cell.photoImageView.image = place.photo
        cell.descLabel.text = place.description

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let onePlaceViewController = segue.destination as? OnePlaceViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPlaceCell = sender as? PlaceTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPlaceCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPlace = places[indexPath.row]
            onePlaceViewController.place = selectedPlace
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

    
    //MARK: - Private Functions
    private func loadSampleData() {
        
        if let tempPlace = Place(name: "Cool Bridge", photo: UIImage(named: "bridge"),
                             description: "Not sure where this is but its pretty.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place Bridge")
        }
        
        if let tempPlace = Place(name: "Taj Mahal", photo: UIImage(named: "taj"),
                                 description: "The Taj Mahal in India.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place Taj")
        }

        if let tempPlace = Place(name: "Eiffel Tower", photo: UIImage(named: "paris"),
                                 description: "The Eiffel Tower in Paris.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place Eiffel Tower")
        }
        
        if let tempPlace = Place(name: "Pryamids", photo: UIImage(named: "pryamid"),
                                 description: "These are the great Pryamids in Eygpt.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place Pryamid")
        }
        
        if let tempPlace = Place(name: "Rio", photo: UIImage(named: "rio"),
                                 description: "This is Rio de Janero in Brazil. Cool place.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place Rio")
        }

        if let tempPlace = Place(name: "Waterfall", photo: UIImage(named: "waterfall"),
                                 description: "This waterfall is in an unknown location, but its beautiful.") {
            places += [tempPlace]
        } else {
            fatalError("Unable to instantiate place waterfall")
        }


    }

}