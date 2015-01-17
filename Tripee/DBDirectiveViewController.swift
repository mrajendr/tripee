//
//  DirectiveViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class DBDirectiveViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var usersAgeLabel: UILabel!
    @IBOutlet var birthdayDatePicker: UIDatePicker!
    @IBOutlet var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.062, green: 0.619, blue: 0.341, alpha: 1)
        self.navigationController?.navigationBarHidden = true
        
        questionLabel?.numberOfLines = 2
        questionLabel?.text = "HOW OLD\nARE YOU?"
        questionLabel?.textAlignment = .Left
        questionLabel?.textColor = .whiteColor()
        questionLabel?.font = UIFont(name: "Avenir-Medium", size: 40)
        
        // Mark: - Show Design Elements
        showUsersAgeLabel()
        showDatePicker()
        
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showUsersAgeLabel() {
        var age: Double = birthdayDatePicker.date.timeIntervalSinceNow / 365 / 60 / 60 / 24
        usersAgeLabel?.text = String(format: "I am \(Int(floor(age/(-1)))) years old")
        usersAgeLabel?.textAlignment = .Center
        usersAgeLabel?.textColor = .whiteColor()
        usersAgeLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
    }
    
    func showDatePicker() {
        birthdayDatePicker?.datePickerMode = .Date
        birthdayDatePicker?.addTarget(self, action: Selector("activateDatePicker"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func activateDatePicker() {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM dd YYYY"
        self.showUsersAgeLabel()
    }
}
