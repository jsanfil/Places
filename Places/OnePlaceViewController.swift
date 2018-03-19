//
//  OnePlaceViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-03-10.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class OnePlaceViewController: UIViewController {
    
    // var place: Place?
    var place: RPlace?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up views if editing an existing Meal.
        if let place = place {
            nameLabel.text = place.name
            descLabel.text = place.description
            photoImage.image = place.photo
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
