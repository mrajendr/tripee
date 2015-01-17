//
//  ViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-16.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var APIUtilities = TripeeAPIUtilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Google places
        
        let taskURL = NSURL(string: APIUtilities.googlePlacesBaseURL + APIUtilities.googlePlacesAPIKey)
        var request: NSURLRequest = NSURLRequest(URL: taskURL!)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        APIUtilities.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(APIUtilities.data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
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

