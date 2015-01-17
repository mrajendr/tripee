//
//  ViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-16.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Define Google places URL
    private let googlePlacesAPIKey: String = "AIzaSyDcJfTNnahsbMXH2gjkj9KIqw4GqzD01_U"
    private let googlePlacesBaseURL  = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key="
    
    var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Google places
        let taskURL = NSURL(string: googlePlacesBaseURL + googlePlacesAPIKey)
        var request: NSURLRequest = NSURLRequest(URL: taskURL!)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        // Get all of the places that the query returned
        let places = jsonResult["results"]! as [[String: AnyObject]]
        for place in places {
            let name = place["name"]! as String
            println(name)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

