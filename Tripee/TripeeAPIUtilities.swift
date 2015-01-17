//
//  TripeeAPIUtilities.swift
//  Tripee
//
//  Created by Ariana Fontenot on 1/16/15.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import Foundation

class TripeeAPIUtilities: NSObject {
    
    // Define Google places URL
    let googlePlacesAPIKey = "AIzaSyDcJfTNnahsbMXH2gjkj9KIqw4GqzD01_U"
    let googlePlacesBaseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key="
    
    var data = NSMutableData()
    
}
