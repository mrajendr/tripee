//
//  DBScheduleViewController.swift
//  Tripee
//
//  Created by Ashley Qian on 1/18/15.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit


class DBScheduleViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a 
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.062, green: 0.619, blue: 0.341, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}