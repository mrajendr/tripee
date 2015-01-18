//
//  DBRecipesViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class DBRecipesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var locationTxtField: UITextField!
    @IBOutlet weak var eventTypePickerView: UIPickerView!
    
    // Set eventTypePickerViews data
    let pickerData = ["amusement_park","art_gallery","bar","cafe","casino","clothing_store","food","gym","movie_theater","museum","night_club","park","restaurent","shopping_mall","spa","store","subway_station","train_station","university","zoo"]
    
    var results = []
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTypePickerView.dataSource = self
        eventTypePickerView.delegate = self
        view.backgroundColor = UIColor(red: 0.086, green: 0.047, blue: 0.050, alpha: 1)
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func locationBtn(sender: AnyObject) {
        var location = self.locationTxtField.text
        // make call to API handle on "Curate Recipe button"
        //let dataModel = DispalyEventViewController()
        //dataModel.getSchduleParameters(location)
    }
    
    @IBAction func makeAPIRequestBtn(sender: AnyObject) {
        
        var location = self.locationTxtField.text
        var type = self.pickerView(eventTypePickerView, titleForRow: self.selectedRow, forComponent: 0)
        
        let dataModel = DispalyEventViewController()
        dataModel.getSchduleParameters(location, type: type)
    }
    
    func displayResults() {
        println(self.results)
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
