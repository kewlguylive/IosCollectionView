//
//  DribbleAPI.swift
//  CollectionView
//
//  Created by preetham uppu on 6/28/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation

class DribbleAPI {
    
    let accessToken = "f40c228219f1253980aa637b0000a5d54ba3b2bacd339385e204ae6ea0231d36"
    
    func loadShots(shotsUrl: String, completion: (([Shot]) -> Void)!) {
        
        var urlString = shotsUrl + "?access_token=" + accessToken + "&page=1&per_page=40"
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                
                
                var error : NSError?
                
                var shotsData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as NSArray
                
                var shots = [Shot]()
                for shot in shotsData{
                    let shot = Shot(data: shot as NSDictionary)
                    shots.append(shot)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
            }
        }
        
        task.resume()
    }
}