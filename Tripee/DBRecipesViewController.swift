//
//  DBRecipesViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class DBRecipesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , MyModalDelegate {
    
    @IBOutlet weak var eventTypePickerView: UIPickerView!

    @IBOutlet weak var countryLbl: UILabel!
    
    // Set eventTypePickerViews data
    let pickerData = ["amusement_park","art_gallery","bar","cafe","casino","clothing_store","food","gym","movie_theater","museum","night_club","park","restaurant","shopping_mall","spa","store","subway_station","train_station","university","zoo"]
    let partnerData = ["friends", "family"];
    var results = []
    var selectedRow = 0
    var selectedCountry = ""
    var count = 0
    //var event = [AnyObject]()
    var event: [AnyObject] = []
    
    override func viewWillAppear(animated: Bool) {
       
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        self.count = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTypePickerView.dataSource = self
        eventTypePickerView.delegate = self
        view.backgroundColor = UIColor(red: 0.086, green: 0.047, blue: 0.050, alpha: 1)
    }
    
    @IBAction func locationBtn(sender: AnyObject) {
        let vc = DBSearchViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func makeAPIRequestBtn(sender: AnyObject) {
        var location = self.countryLbl!.text
        var type = self.pickerView(eventTypePickerView, titleForRow: self.selectedRow, forComponent: 0)
        println(type)
        let dataModel = DispalyEventViewController()
        dataModel.getSchduleParameters(location, type: type)
        if  (self.count == 2){
            self.performSegueWithIdentifier("GoToScheduleView", sender: self)
        }else {
            self.count++
        }
    }
    
    func setLabelDisplay(country:String) {
        self.selectedCountry = country
    }
    
    func myModalDidFinish(controller: DBSearchViewController, country: String) {
        self.countryLbl!.text = country
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayResults() {
        //println(self.results)
        if (self.results.count != 0){
            println(self.event)
            var topEvent : AnyObject = self.results[0]
            self.event.append(topEvent)
            //self.event += topEvent
            println(self.event)
        } else {
            self.count -= 1
            var alert: UIAlertView? = nil
            alert = UIAlertView(title: "No Places Found",
                message: "There were no places found :(. Please try another.",
                delegate: nil,
                cancelButtonTitle: "OK")
            alert!.show()
        }
        
        // put each element in arry in a dictionary and then display name and icon of restaurents
    }
    
    //MARK - Delegates and Data Source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
