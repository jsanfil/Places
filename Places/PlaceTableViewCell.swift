//
//  PlaceTableViewCell.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-03-07.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
