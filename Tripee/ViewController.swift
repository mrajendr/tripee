//
//  ViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-16.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityTxtField: UITextField!
    
    var address = "" as String
    
    @IBAction func goToSchedule(sender: AnyObject) {
        // Set an address parameter to pass into next view
        self.address = cityTxtField.text
        performSegueWithIdentifier("GoToMap", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let theDestination = (segue.destinationViewController as DispalyEventsViewController)
        theDestination.address = self.address
     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

