//
//  DisplayEventViewController.swift
//  Tripee
//
//  Created by Ashley Qian on 1/17/15.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit
import CoreLocation

class DispalyEventViewController: UIViewController {
    var lat = 0 as CLLocationDegrees
    var long = 0 as CLLocationDegrees
    private let googlePlacesAPIKey: String = "AIzaSyDcJfTNnahsbMXH2gjkj9KIqw4GqzD01_U"
    //private var baseURL  = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key="
    
    lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getSchduleParameters(address: String!, type: String!) {
        println(address)
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address, {(placemarks: [AnyObject]!, error: NSError!) -> Void in
            println(placemarks)
            if error != nil {
                println("Geocode failed with error: \(error.localizedDescription)")
            } else if placemarks.count > 0 {
                var placemark = placemarks[0] as CLPlacemark
                var location = placemark.location
                var coordinate = location.coordinate as CLLocationCoordinate2D
                self.lat = coordinate.latitude
                self.long = coordinate.longitude
                println("Lat: \(self.lat) Long: \(self.long)")
                
                var baseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(self.lat),\(self.long)&radius=500&types=\(type)&key="
                println(baseURL)
                var urlString = baseURL + self.googlePlacesAPIKey
                let taskURL = NSURL(string:urlString)
                var request: NSURLRequest = NSURLRequest(URL: taskURL!)
                var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
                connection.start()
            }
        })
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError?
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        if let results = jsonResult["results"] as? NSArray {
            let recipesVC = DBRecipesViewController()
            recipesVC.results = results
            recipesVC.displayResults()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}