//
//  DisplayEventsViewController.swift
//  Tripee
//
//  Created by Ashley Qian on 1/17/15.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit
import CoreLocation

class DispalyEventsViewController: UIViewController {
    
    private let googlePlacesAPIKey: String = "AIzaSyDcJfTNnahsbMXH2gjkj9KIqw4GqzD01_U"
    private var baseURL  = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key="
    
    lazy var data = NSMutableData()
    
    var address = "" as String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get url
        var urlString = baseURL + googlePlacesAPIKey
        let taskURL = NSURL(string: baseURL + googlePlacesAPIKey)
        var request: NSURLRequest = NSURLRequest(URL: taskURL!)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
        
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.address, {(placemarks: [AnyObject]!, error: NSError!) -> Void in
            if placemarks.count > 0 {
                var placemark = placemarks[0] as CLPlacemark
                var location = placemark.location
                var coordinate = location.coordinate as CLLocationCoordinate2D
                var lat : CLLocationDegrees = coordinate.latitude
                var long : CLLocationDegrees = coordinate.longitude
                println("Lat: \(lat) Long: \(long)")
            }
        })
        println("Adress 2: \(self.address)")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        //println(jsonResult)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}