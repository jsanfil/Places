//
//  PostViewController.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-04-22.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit
import Cosmos
import os.log

// TODO:
// - convert images to Kingfisher
// - create an image name so that we can post the image to S3

class PostViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Post Data
    var place = RPlace()

    var imagePicked: UIImage?
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var ratingField: CosmosView!
    @IBOutlet weak var categoryField: UILabel!
    @IBOutlet weak var sharingField: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("SettingsViewController viewDidLoad():", place)
        imagePicker.delegate = self
    }

    // Action Sheet that allows user to take photo or pic from photo library
    @IBAction func imageAction(_ sender: Any) {
        // create an actionSheet
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // create the actions
        let firstAction: UIAlertAction = UIAlertAction(title: "Take Picture or Video", style: .default) { action -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera;
                self.imagePicker.allowsEditing = false
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let secondAction: UIAlertAction = UIAlertAction(title: "Photo Library", style: .default) { action -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.imagePicker.sourceType = .photoLibrary;
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)
        
        // present an actionSheet...
        present(actionSheetController, animated: true, completion: nil)
    }
    
    // Delegate function: handles a selected image from camera or photo library
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated:true, completion: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        updateModelData()
        
        if segue.identifier == "categorySegue" {
            let destination = segue.destination as! CategoryTableViewController
            destination.place = place
        }
        if segue.identifier == "sharingSegue" {
            let destination = segue.destination as! SharingTableViewController
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
        sharingField.text = place.access ?? "Select mode"
        if let myImage = imagePicked {
            imageButton.setImage(myImage, for: .normal)
        } else {
            let imageName = place.defaultImage ?? "defaultPhoto"
            imageButton.setImage(UIImage(named: imageName), for: .normal)
        }
        print("Rating", place.rating)
        print("Place", place.toJSONString())

    }
 
    private func updateModelData() {
        place.name = nameField.text
        place.author = authorField.text
        place.rating = ratingField.rating
        place.category = categoryField.text
        place.access = sharingField.text
        // image name gets set when you change the image in the image button action
    }
}
