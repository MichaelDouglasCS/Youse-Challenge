//
//  Photo.swift
//  Youse-Auto
//
//  Created by Michael Douglas on 13/08/18.
//  Copyright © 2018 Michael Douglas. All rights reserved.
//

import SwiftyJSON

struct Photo {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var id: String?
    var width: Int?
    var height: Int?
    var url: URL?
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init() {  }
    
    init?(json: JSON) {
        guard let id = json["photo_reference"].string, !id.isEmpty else { return nil }
        
        self.id = id
        self.width = json["width"].int
        self.height = json["height"].int
        
        let path = NetworkService.CarRepair.image(fromReferenceID: id,
                                                  width: self.width ?? 400,
                                                  height: self.height).path
        self.url = URL(string: path)
    }
}
