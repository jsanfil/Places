//
//  OnePlaceViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-03-10.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit
import Kingfisher
import os

class OnePlaceViewController: UIViewController {
    
    // var place: Place?
    var place: RPlace?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up views if editing an existing place.
        if let place = place {
            nameLabel.text = place.name
            descLabel.text = place.description
            // photoImage.image = UIImage(named: place.defaultImage ?? "defaultPhoto")
            let url = URL(string: "http://localhost:3000/images/" + (place.defaultImage ?? "paris.jpg"))
            photoImage.kf.setImage(with: url)

        }

    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "editPostSegue":
            os_log("Edit a Post", log: OSLog.default, type: .debug)
            guard let destinationViewController = segue.destination as? PostViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            destinationViewController.place = place!
           
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
