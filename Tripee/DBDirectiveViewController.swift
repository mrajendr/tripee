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
    var age: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.062, green: 0.619, blue: 0.341, alpha: 1)
        
        // Mark: - Show Design Elements
        showQuestionLabel()
//        showCard()
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
    

    // Mark: - Create Design Elements
    func showQuestionLabel() {
        questionLabel?.numberOfLines = 2
        questionLabel?.text = "HOW OLD\nARE YOU?"
        questionLabel?.textAlignment = .Left
        questionLabel?.textColor = .whiteColor()
        questionLabel?.font = UIFont(name: "Avenir-Medium", size: 40)
    }
    
//    func showCard() {
//        let directiveView = DBDirectiveView()
//        directiveView.frame = CGRectMake(24.5, 220, 321.5, 222)
//        view.addSubview(directiveView)
//    }
    
    func showUsersAgeLabel() {
        
        var dateFromTimeInterval = NSDate(timeIntervalSinceReferenceDate: birthdayDatePicker.date)
        age = NSDate.dateByAddingTimeInterval(dateFromTimeInterval)
        usersAgeLabel?.text = String(format: "I am \(age) years old")
        usersAgeLabel?.textAlignment = .Center
        usersAgeLabel?.textColor = .whiteColor()
        usersAgeLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
    }
    
    func showDatePicker() {
        
        birthdayDatePicker?.datePickerMode = .Date
        birthdayDatePicker?.tintColor = .whiteColor()
        birthdayDatePicker?.addTarget(self, action: Selector("activateDatePicker"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func activateDatePicker() {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM dd YYYY"
        println(dateFormatter.stringFromDate(birthdayDatePicker.date))
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
