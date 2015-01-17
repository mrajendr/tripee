//
//  DBSearchViewController.swift
//  Tripee
//
//  Created by Douglas Bumby on 2015-01-17.
//  Copyright (c) 2015 Douglas Bumby. All rights reserved.
//

import UIKit

class DBSearchViewController: UITableViewController {

    @IBOutlet var searchBarTop: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.062, green: 0.619, blue: 0.341, alpha: 1)
        
        self.navigationItem.titleView = self.searchBarTop
        
//        let searchBarItem = UIBarButtonItem(customView: searchBarTop)
//        navigationItem.rightBarButtonItem = searchBarItem;

        
//        self.navigationItem.titleView = self.searchBarTop;
//        To put searchBar to the left/right side of navigationBar:
//        
//        UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
//        self.navigationItem.rightBarButtonItem = searchBarItem;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        
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
