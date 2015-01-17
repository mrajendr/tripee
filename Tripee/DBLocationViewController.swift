//
//  DBLocationViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit
import CoreLocation

class DBLocationGetter: UIViewController {
    
    let locationManager: CLLocationManager?
    
    func deviceLocation() -> String {
        
//        return String(format: "latitude: %f longitude: %f", locationManager?.location.coordinate.latitude!, locationManager?.location.coordinate.longitude!)
        return deviceLocation()
    }
    
    func requestAlwaysAuthorization() -> CLLocationManager {
        return requestAlwaysAuthorization()
    }
    
    override func viewDidLoad() {
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager?.startUpdatingLocation()
        
        println(self.deviceLocation())
    }
    
    
}