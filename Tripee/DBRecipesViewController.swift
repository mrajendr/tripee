//
//  DBRecipesViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class DBRecipesViewController: UIViewController {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.086, green: 0.047, blue: 0.050, alpha: 1)
        self.navigationController?.navigationBarHidden = true
        
        // Do any additional setup after loading the view.
        
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
