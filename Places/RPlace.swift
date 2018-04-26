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
    var author: String?
    var access: String?
    var defaultImage: String?
    var category: String?
    var images: [String]?
    var location: [Float]?
    var rating: Float?
    
    required init(map: Map){
        self.defaultImage = "defaultPhoto"
    }
    
    init () {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        author <- map["author"]
        access <- map["access"]
        defaultImage <- map["defaultImage"]
        category <- map["category"]
        images <- map["images"]
        location <- map["location"]
        rating <- map["rating"]
    }
}
