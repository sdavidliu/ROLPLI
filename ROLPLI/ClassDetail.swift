//
//  ClassDetail.swift
//  ROLPLI
//
//  Created by Jimy Liu Mini on 6/13/16.
//  Copyright © 2016 Dave&Joe. All rights reserved.
//

import UIKit
import Firebase

class ClassDetail: UITableViewController {
    
    var links = [String]()
    var array = [String]()
    var name: String? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        
        self.title = name
        links = ["null"]
        array = ["收看(高清)"]
        
        let ref = FIRDatabase.database().reference()
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            //Display and links for 收看(高清)
            var s = snapshot.value!.objectForKey(self.name! + "1a")! as! String
            var Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.array.append(part)
            }
            s = snapshot.value!.objectForKey(self.name! + "1b")! as! String
            Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.links.append(part)
            }
            
            //Display and links for 收聽
            self.links.append("null")
            self.array.append("收聽")
            s = snapshot.value!.objectForKey(self.name! + "2a")! as! String
            Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.array.append(part)
            }
            s = snapshot.value!.objectForKey(self.name! + "2b")! as! String
            Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.links.append(part)
            }
            
            //Display and links for 講義
            self.links.append("null")
            self.array.append("講義")
            s = snapshot.value!.objectForKey(self.name! + "3a")! as! String
            Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.array.append(part)
            }
            s = snapshot.value!.objectForKey(self.name! + "3b")! as! String
            Str = s.componentsSeparatedByString(",")
            for part in Str {
                self.links.append(part)
            }
            
            self.tableView.reloadData()
            }, withCancelBlock: { error in
                print(error.description)
        })
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = array[indexPath.row]
        return cell;
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if (links[indexPath.row] != "null"){
            
            let link = links[indexPath.row]
            let index = link.startIndex.advancedBy(link.characters.count - 3)..<link.endIndex
            let ending = link[index]
            
            if (ending == "mp3" || ending == "pdf"){
                UIApplication.sharedApplication().openURL(NSURL(string: link)!)
            }else{
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setValue(links[indexPath.row], forKey: "link")
                defaults.synchronize()
                
                self.performSegueWithIdentifier("ShowWebView", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue("All", forKey: "orientation")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
