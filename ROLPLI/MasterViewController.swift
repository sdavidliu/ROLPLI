//
//  MasterViewController.swift
//  ROLPLI
//
//  Created by Jimy Liu Mini on 6/10/16.
//  Copyright © 2016 Dave&Joe. All rights reserved.
//

import UIKit
import Firebase

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var objects = [String]()
    var classList1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue("All", forKey: "orientation")
        defaults.synchronize()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.title = "生命河教牧領袖學院"
        objects = ["新開課程", "學院行事暦", "證書班", "共同科目", "碩士必修", "常問問題", "聯絡我們"]
        
        _ = FIRDatabase.database().reference()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue("All", forKey: "orientation")
        defaults.synchronize()
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setValue(objects[indexPath.row], forKey: "menu")
                defaults.synchronize()
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                let backItem = UIBarButtonItem()
                backItem.title = "Back"
                navigationItem.backBarButtonItem = backItem
                navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = objects[indexPath.row]
        return cell
    }
    
}

