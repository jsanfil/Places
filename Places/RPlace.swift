//
//  RPlace.swift
//  Places
//
//  Created by Joe Sanfilippo on 2018-03-18.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class RPlace: Mappable {
    var name: String?
    var description: String?
    var photo: UIImage?
    
    required init?(map: Map){
        self.photo = UIImage(named: "defaultPhoto")
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
    }
}
