//
//  Shot.swift
//  CollectionView
//
//  Created by preetham uppu on 6/28/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation

class Shot{
    
    var id : Int!
    var title : String!
   
    var imageUrl : String!

    var imageData : NSData?
    
    init(data : NSDictionary){
        
        self.id = data["id"] as Int
        
        self.title = Utils.getStringFromJSON(data, key: "title")
        
        let images = data["images"] as NSDictionary
        
        self.imageUrl = Utils.getStringFromJSON(images, key: "normal")
    }
}
