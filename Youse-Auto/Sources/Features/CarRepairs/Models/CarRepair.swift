//
//  CarRepair.swift
//  Youse-Auto
//
//  Created by Michael Douglas on 12/08/18.
//  Copyright © 2018 Michael Douglas. All rights reserved.
//

import Foundation
import SwiftyJSON

class CarRepair: NSObject {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var id: String?
    var placeID: String?
    var name: String?
    var rating: Double?
    var address: String?
    var isOpenNow: Bool?
    var imageReference: Photo?
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init?(json: JSON) {
        guard let placeID = json["place_id"].string, !placeID.isEmpty else { return nil }
        guard let name    = json["name"].string, !name.isEmpty else { return nil }
        
        self.id        = json["id"].string
        self.placeID   = placeID
        self.name      = name
        self.rating    = json["rating"].double
        self.address   = json["vicinity"].string
        self.isOpenNow = json["opening_hours"]["open_now"].bool
        
        if let photoJSON = json["photos"].array?.first {
            self.imageReference = Photo(json: photoJSON)
        }
    }
}