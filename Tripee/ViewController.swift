//
//  ViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-16.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let googlePlacesAPIKey: String = "AIzaSyDcJfTNnahsbMXH2gjkj9KIqw4GqzD01_U"
    private let baseURL  = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key="
    
    lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get url
        let taskURL = NSURL(string: baseURL + googlePlacesAPIKey)
        var request: NSURLRequest = NSURLRequest(URL: taskURL!)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

