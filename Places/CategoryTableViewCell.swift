//
//  CategoryTableViewCell.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-04-27.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
