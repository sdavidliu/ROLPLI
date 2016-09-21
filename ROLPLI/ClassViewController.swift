//
//  ClassViewController.swift
//  ROLPLI
//
//  Created by Jimy Liu Mini on 6/26/16.
//  Copyright © 2016 Dave&Joe. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {
    
    var portrait = true
    var initial = true
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        default:                                        return identifier
        }
        
        //Goes down: iPod Touch 5, iPod Touch 6, iPhone 4s, iPhone SE, iPad Air 2
        //Goes up: iPhone 6, iPhone 6s
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)){
            portrait = false
        }else{
            portrait = true
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ClassViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        openWebView()
    }
    
    func openWebView(){
        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let url = NSURL (string: defaults.stringForKey("link")!)
        //let url = NSURL (string: defaults.stringForKey("http://username:password@rolpli.org/rolpli/classes/PC102_16/document/PC102-Doc/07.PC102.pdf")!)
        let requestObj = NSURLRequest(URL: url!);
        
        if (initial == false){
            let webView = UIWebView(frame: CGRect(x: 0, y: navigationBarHeight! + statusBarHeight, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - navigationBarHeight! - statusBarHeight))
            webView.loadRequest(requestObj)
            self.view.addSubview(webView)
        }else{
            if (modelName == "iPhone 6" || modelName == "iPhone 6s"){
                let webView = UIWebView(frame: CGRect(x: 0, y: navigationBarHeight! + statusBarHeight, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - navigationBarHeight! - statusBarHeight))
                webView.loadRequest(requestObj)
                self.view.addSubview(webView)
            }else{
                let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
                webView.loadRequest(requestObj)
                self.view.addSubview(webView)
            }
        }
        initial = false
    }
    
    func rotated(){
        
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation) && portrait == true){
            portrait = false
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            openWebView()
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) && portrait == false){
            portrait = true
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            openWebView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
