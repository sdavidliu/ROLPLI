//
//  DetailViewController.swift
//  ROLPLI
//
//  Created by Jimy Liu Mini on 6/10/16.
//  Copyright © 2016 Dave&Joe. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var array1 = [String]()
    var scrollView: UIScrollView!
    var containerView = UIView()
    var className = String()
    var tableView: UITableView = UITableView()
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    var portrait = true
    var initialLandscape = false
    var initial = true
    var detailItem: String? {
        didSet {
            //self.configureView()
        }
    }
    
    func configureView() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let option = defaults.stringForKey("menu")
        
        if (option == "新開課程"){
            新開課程()
        }else if (option == "學院行事暦"){
            學院行事暦()
        }else if (option == "證書班"){
            證書班()
        }else if (option == "共同科目"){
            共同科目()
        }else if (option == "碩士必修"){
            碩士必修()
        }else if (option == "常問問題"){
            常問問題()
        }else if (option == "聯絡我們"){
            聯絡我們()
        }
        
    }
    
    func 新開課程(){
        self.title = "新開課程"
        array1 = []
        
        let ref = FIRDatabase.database().reference()
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            let s = snapshot.value!.objectForKey("class1")! as! String
            
            let Str = s.componentsSeparatedByString(",")
            
            for part in Str {
                self.array1.append(part)
            }
            
            self.tableView.reloadData()
            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 44, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 44), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }else{
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 64), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }
            }else{
                self.tableView = UITableView(frame: CGRectMake(0, 32, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 32), style: UITableViewStyle.Plain)
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                self.view.addSubview(self.tableView)
            }
        }else{
            self.tableView = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(self.tableView)
        }
        initial = false
    }
    
    func 學院行事暦(){
        self.title = "學院行事暦"
        
        let url = NSURL (string: "https://calendar.google.com/calendar/embed?src=rolpli.ca%40gmail.com&ctz=America/Los_Angeles")
        let requestObj = NSURLRequest(URL: url!);
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    let webView = UIWebView(frame: CGRect(x: 0, y: statusBarHeight + 44, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - statusBarHeight - 44))
                    webView.loadRequest(requestObj)
                    self.view.addSubview(webView)
                }else{
                    let webView = UIWebView(frame: CGRect(x: 0, y: statusBarHeight + 64, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - statusBarHeight - 64))
                    webView.loadRequest(requestObj)
                    self.view.addSubview(webView)
                }
            }else{
                let webView = UIWebView(frame: CGRect(x: 0, y: 32, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - 32))
                webView.loadRequest(requestObj)
                self.view.addSubview(webView)
            }
        }else{
            let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
            webView.loadRequest(requestObj)
            self.view.addSubview(webView)
        }
        initial = false
    }
    
    func 證書班(){
        self.title = "證書班"
        array1 = []
        
        let ref = FIRDatabase.database().reference()
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            let s = snapshot.value!.objectForKey("class2")! as! String
            
            let Str = s.componentsSeparatedByString(",")
            
            for part in Str {
                self.array1.append(part)
            }
            
            self.tableView.reloadData()
            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 44, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 44), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }else{
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 64), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }
            }else{
                self.tableView = UITableView(frame: CGRectMake(0, 32, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 32), style: UITableViewStyle.Plain)
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                self.view.addSubview(self.tableView)
            }
        }else{
            self.tableView = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(self.tableView)
        }
        initial = false
    }
    
    func 共同科目(){
        self.title = "共同科目"
        array1 = []
        
        let ref = FIRDatabase.database().reference()
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            let s = snapshot.value!.objectForKey("class3")! as! String
            
            let Str = s.componentsSeparatedByString(",")
            
            for part in Str {
                self.array1.append(part)
            }
            
            self.tableView.reloadData()
            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 44, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 44), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }else{
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 64), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }
            }else{
                self.tableView = UITableView(frame: CGRectMake(0, 32, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 32), style: UITableViewStyle.Plain)
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                self.view.addSubview(self.tableView)
            }
        }else{
            self.tableView = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(self.tableView)
        }
        initial = false
    }
    
    func 碩士必修(){
        self.title = "碩士必修"
        array1 = []
        
        let ref = FIRDatabase.database().reference()
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            let s = snapshot.value!.objectForKey("class4")! as! String
            
            let Str = s.componentsSeparatedByString(",")
            
            for part in Str {
                self.array1.append(part)
            }
            
            self.tableView.reloadData()
            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 44, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 44), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }else{
                    self.tableView = UITableView(frame: CGRectMake(0, statusBarHeight + 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - statusBarHeight - 64), style: UITableViewStyle.Plain)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                    self.view.addSubview(self.tableView)
                }
            }else{
                self.tableView = UITableView(frame: CGRectMake(0, 32, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 32), style: UITableViewStyle.Plain)
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
                self.view.addSubview(self.tableView)
            }
        }else{
            self.tableView = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(self.tableView)
        }
        initial = false
    }
    
    func 常問問題(){
        self.title = "常問問題"
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let height = screenSize.height
        let width = screenSize.width
        
        let mainTitle = UILabel(frame: CGRectMake(5, 5, width - 10, 20))
        mainTitle.textAlignment = NSTextAlignment.Left
        mainTitle.text = "正式生常問問題"
        mainTitle.font = UIFont(name: (mainTitle.font?.fontName)!, size: 20)
        mainTitle.textColor = UIColor.redColor()
        mainTitle.sizeToFit()
        
        let bodyText = UILabel(frame: CGRectMake(5, 40, width - 10, height*2))
        bodyText.textAlignment = NSTextAlignment.Left
        bodyText.text = "1、如果我先申請文憑(碩士)班，將來可以轉換為碩士(文憑)班嗎？\n可以的！如果不確定你的目標，可以先從文憑班開始。等到較明確了，可以做轉換。只要你不是太晚做決定，學分都不會浪費。\n\n2、我一定要有學士文憑，才能申請入學嗎？\n文憑班與碩士班是研究所程度的課程，如果要拿到文憑班或碩士班學位，最低先需有學士文憑或同等學歷。如果你有二專或三專文憑(Associate Degree)加上足夠的工作經歷，你可能已符合同等學歷的要求。請與我們的教務處聯繫詢問詳情。\n\n3、請問修讀年限為何?\n沒有修讀年限，但根據經驗，拖太久，不容易持續下去。\n\n4、有關推薦信函,有何規定?\n證書班需要一封推薦信。文憑班與碩士班需要兩封。請將推薦表交給推薦人，直接由推薦人寄給我們。如果急於開始，可以先送上申請單與申請費，推薦表與自傳可以隨後補上。\n\n5、文憑班與碩士班，除了牧師推薦另外的推薦人有何規定?\n除牧長的一封外，任何的屬靈領袖(區牧長，長老，主日學老師 等等)都可以。請將推薦表交給推薦人，直接由推薦人寄給我們。如果急於開始，可以先送上申請單與申請費，推薦表與自傳可以稍晚再寄到。\n\n6、在網上修讀的方式,如果有問題如何交通?\n有何修讀規定?大部分的課可以與老師email聯繫。如果正巧現場開課時間，教授通常可以電話聯絡。如果教授無法聯絡上，我們多位同工受過正式神學訓練，你可以隨時來電或Email與教務部聯絡。\n\n7、網上修讀最多一學期可修讀多少學分?\n沒有限制，但我們不鼓勵同時選修超過12學分，決大部分的課程都需要花一些時間寫作業。\n\n8、請問讀書報告有什麼要求嗎？\n如果老師有規定，讀書報告以老師指示為準。如無，可參考以下建議。通常2學分的課，閱讀頁數大約400頁，3學分大約650頁。\n讀書報告應該包括下列兩部分\nI. 書籍大綱\n記下每章的標題，然後在每章都寫下3-5個重要關鍵點。\nII. 心得與應用\n讀完此書後，你有什麼新的學習，你對書中內容所提的議題上有什麼認知的改變，有什麼你可應用在你的日常生活或服事上等等… (這部分每100頁厚的閱讀寫 大約1000字的心得與應用)\n\n9、我是國際學生，請問學院有頒發I-20嗎？\n目前我們還未向美國教育部申請接受國際學生。\n\n10、我在其他的神學院有修過一些課，生命河教牧領袖學院承認那些學分嗎？\n因各個學校對課程的內容與要求不盡相同，我們需要逐件審查。請附上成績單與課程內容簡介(syllabus)，送至教務處審查。\n\n11、網路資訊上有文憑、証書及研究生課程‧我有學士文憑,你會建議我選讀研究生文憑嗎?\n或者你有何建議?需要看你服事的方向與你的時間，碩士班要較久（66學分）如果不確定你的目標，你可以先從文憑班開始。等到較明確了，可以做轉換。但基本上，只要你不是太晚決定方向，學分都不會浪費。\n\n12. 關於選課,你有何建議?\n需要知道你的需要與現況，才好回答，歡迎來電。"
        bodyText.font = UIFont(name: (mainTitle.font?.fontName)!, size: 12)
        bodyText.numberOfLines = 0
        bodyText.sizeToFit()
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    scrollView = UIScrollView(frame: CGRect(x: 0, y: statusBarHeight + 44, width: width, height: height - statusBarHeight - 44))
                    scrollView.delegate = self
                    scrollView.contentSize = CGSizeMake(width, bodyText.frame.height + mainTitle.frame.height + 30)
                }else{
                    scrollView = UIScrollView(frame: CGRect(x: 0, y: statusBarHeight + 64, width: width, height: height - statusBarHeight - 64))
                    scrollView.delegate = self
                    scrollView.contentSize = CGSizeMake(width, bodyText.frame.height + mainTitle.frame.height + 30)
                }
            }else{
                scrollView = UIScrollView(frame: CGRect(x: 0, y: 32, width: width, height: height - 32))
                scrollView.delegate = self
                scrollView.contentSize = CGSizeMake(width, bodyText.frame.height + mainTitle.frame.height + 30)
            }
        }else{
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            scrollView.delegate = self
            scrollView.contentSize = CGSizeMake(width, bodyText.frame.height + mainTitle.frame.height + 30)
        }
        initial = false
        
        containerView = UIView()
        containerView.addSubview(mainTitle)
        containerView.addSubview(bodyText)
        scrollView.addSubview(containerView)
        self.view.addSubview(scrollView)
    }
    
    func 聯絡我們(){
        self.title = "聯絡我們"
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let height = screenSize.height
        let width = screenSize.width
        
        let attributes = [NSFontAttributeName : UIFont.systemFontOfSize(14.0),
                          NSForegroundColorAttributeName : UIColor.blueColor(),
                          NSUnderlineStyleAttributeName : 1]
        
        if (initial == false){
            if (portrait == true){
                if (initialLandscape == false){
                    let navBar: CGFloat = 44.0
                    let mainTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 10, width - 10, 50))
                    mainTitle.textAlignment = NSTextAlignment.Left
                    mainTitle.text = "聯絡資料"
                    mainTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                    mainTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    mainTitle.sizeToFit()
                    
                    let rolpliTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 40, width - 10, height))
                    rolpliTitle.textAlignment = NSTextAlignment.Left
                    rolpliTitle.text = "River of Life Pastoral Leadership Institute (ROLPLI)"
                    rolpliTitle.font = UIFont(name: "HelveticaNeue", size: 16)
                    rolpliTitle.numberOfLines = 0
                    rolpliTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    rolpliTitle.sizeToFit()
                    
                    let addressTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 100, width - 10, height))
                    addressTitle.textAlignment = NSTextAlignment.Left
                    addressTitle.text = "ADDRESS"
                    addressTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    addressTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    addressTitle.sizeToFit()
                    
                    let address = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 110, width: width-10, height: 100))
                    let addressString = NSMutableAttributedString(string: "River of Life Christian Church\n1177 Laurelwood Road\nSanta Clara, CA 95054", attributes: attributes)
                    address.setAttributedTitle(addressString, forState: .Normal)
                    address.titleLabel?.numberOfLines = 0
                    address.addTarget(self, action: #selector(addressAction), forControlEvents: .TouchUpInside)
                    address.sizeToFit()
                    
                    let emailTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 180, width - 10, height))
                    emailTitle.textAlignment = NSTextAlignment.Left
                    emailTitle.text = "EMAIL"
                    emailTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    emailTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    emailTitle.sizeToFit()
                    
                    let email = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 190, width: width-10, height: 20))
                    let emailString = NSMutableAttributedString(string: "admission@rolpli.org", attributes: attributes)
                    email.setAttributedTitle(emailString, forState: .Normal)
                    email.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
                    email.sizeToFit()
                    
                    let phoneTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 230, width - 10, height))
                    phoneTitle.textAlignment = NSTextAlignment.Left
                    phoneTitle.text = "PHONE"
                    phoneTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    phoneTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    phoneTitle.sizeToFit()
                    
                    let phone = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 240, width: width-10, height: 20))
                    let phoneString = NSMutableAttributedString(string: "408-260-0257 x 300", attributes: attributes)
                    phone.setAttributedTitle(phoneString, forState: .Normal)
                    phone.addTarget(self, action: #selector(phoneAction), forControlEvents: .TouchUpInside)
                    phone.sizeToFit()
                    
                    let faxTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 280, width - 10, height))
                    faxTitle.textAlignment = NSTextAlignment.Left
                    faxTitle.text = "FAX"
                    faxTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    faxTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    faxTitle.sizeToFit()
                    
                    let fax = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 290, width: width-10, height: 20))
                    let faxString = NSMutableAttributedString(string: "408-748-8877", attributes: attributes)
                    fax.setAttributedTitle(faxString, forState: .Normal)
                    fax.addTarget(self, action: #selector(faxAction), forControlEvents: .TouchUpInside)
                    fax.sizeToFit()
                    
                    let webTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 330, width - 10, height))
                    webTitle.textAlignment = NSTextAlignment.Left
                    webTitle.text = "WEBSITE"
                    webTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    webTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    webTitle.sizeToFit()
                    
                    let web = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 340, width: width-10, height: 20))
                    let webString = NSMutableAttributedString(string: "http://www.rolpli.org/", attributes: attributes)
                    web.setAttributedTitle(webString, forState: .Normal)
                    web.addTarget(self, action: #selector(webAction), forControlEvents: .TouchUpInside)
                    web.sizeToFit()
                    
                    self.view.addSubview(mainTitle)
                    self.view.addSubview(rolpliTitle)
                    self.view.addSubview(addressTitle)
                    self.view.addSubview(address)
                    self.view.addSubview(emailTitle)
                    self.view.addSubview(email)
                    self.view.addSubview(phoneTitle)
                    self.view.addSubview(phone)
                    self.view.addSubview(faxTitle)
                    self.view.addSubview(fax)
                    self.view.addSubview(webTitle)
                    self.view.addSubview(web)
                }else{
                    let navBar: CGFloat = 64.0
                    let mainTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 10, width - 10, 50))
                    mainTitle.textAlignment = NSTextAlignment.Left
                    mainTitle.text = "聯絡資料"
                    mainTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                    mainTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    mainTitle.sizeToFit()
                    
                    let rolpliTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 40, width - 10, height))
                    rolpliTitle.textAlignment = NSTextAlignment.Left
                    rolpliTitle.text = "River of Life Pastoral Leadership Institute (ROLPLI)"
                    rolpliTitle.font = UIFont(name: "HelveticaNeue", size: 16)
                    rolpliTitle.numberOfLines = 0
                    rolpliTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    rolpliTitle.sizeToFit()
                    
                    let addressTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 100, width - 10, height))
                    addressTitle.textAlignment = NSTextAlignment.Left
                    addressTitle.text = "ADDRESS"
                    addressTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    addressTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    addressTitle.sizeToFit()
                    
                    let address = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 110, width: width-10, height: 100))
                    let addressString = NSMutableAttributedString(string: "River of Life Christian Church\n1177 Laurelwood Road\nSanta Clara, CA 95054", attributes: attributes)
                    address.setAttributedTitle(addressString, forState: .Normal)
                    address.titleLabel?.numberOfLines = 0
                    address.addTarget(self, action: #selector(addressAction), forControlEvents: .TouchUpInside)
                    address.sizeToFit()
                    
                    let emailTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 180, width - 10, height))
                    emailTitle.textAlignment = NSTextAlignment.Left
                    emailTitle.text = "EMAIL"
                    emailTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    emailTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    emailTitle.sizeToFit()
                    
                    let email = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 190, width: width-10, height: 20))
                    let emailString = NSMutableAttributedString(string: "admission@rolpli.org", attributes: attributes)
                    email.setAttributedTitle(emailString, forState: .Normal)
                    email.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
                    email.sizeToFit()
                    
                    let phoneTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 230, width - 10, height))
                    phoneTitle.textAlignment = NSTextAlignment.Left
                    phoneTitle.text = "PHONE"
                    phoneTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    phoneTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    phoneTitle.sizeToFit()
                    
                    let phone = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 240, width: width-10, height: 20))
                    let phoneString = NSMutableAttributedString(string: "408-260-0257 x 300", attributes: attributes)
                    phone.setAttributedTitle(phoneString, forState: .Normal)
                    phone.addTarget(self, action: #selector(phoneAction), forControlEvents: .TouchUpInside)
                    phone.sizeToFit()
                    
                    let faxTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 280, width - 10, height))
                    faxTitle.textAlignment = NSTextAlignment.Left
                    faxTitle.text = "FAX"
                    faxTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    faxTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    faxTitle.sizeToFit()
                    
                    let fax = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 290, width: width-10, height: 20))
                    let faxString = NSMutableAttributedString(string: "408-748-8877", attributes: attributes)
                    fax.setAttributedTitle(faxString, forState: .Normal)
                    fax.addTarget(self, action: #selector(faxAction), forControlEvents: .TouchUpInside)
                    fax.sizeToFit()
                    
                    let webTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 330, width - 10, height))
                    webTitle.textAlignment = NSTextAlignment.Left
                    webTitle.text = "WEBSITE"
                    webTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                    webTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    webTitle.sizeToFit()
                    
                    let web = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 340, width: width-10, height: 20))
                    let webString = NSMutableAttributedString(string: "http://www.rolpli.org/", attributes: attributes)
                    web.setAttributedTitle(webString, forState: .Normal)
                    web.addTarget(self, action: #selector(webAction), forControlEvents: .TouchUpInside)
                    web.sizeToFit()
                    
                    self.view.addSubview(mainTitle)
                    self.view.addSubview(rolpliTitle)
                    self.view.addSubview(addressTitle)
                    self.view.addSubview(address)
                    self.view.addSubview(emailTitle)
                    self.view.addSubview(email)
                    self.view.addSubview(phoneTitle)
                    self.view.addSubview(phone)
                    self.view.addSubview(faxTitle)
                    self.view.addSubview(fax)
                    self.view.addSubview(webTitle)
                    self.view.addSubview(web)
                }
            }else{
                let navBar: CGFloat = 32.0
                
                let mainTitle = UILabel(frame: CGRectMake(5, navBar + 10, width - 10, 50))
                mainTitle.textAlignment = NSTextAlignment.Left
                mainTitle.text = "聯絡資料"
                mainTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                mainTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                mainTitle.sizeToFit()
                
                let rolpliTitle = UILabel(frame: CGRectMake(5, navBar + 40, width - 10, height))
                rolpliTitle.textAlignment = NSTextAlignment.Left
                rolpliTitle.text = "River of Life Pastoral Leadership Institute (ROLPLI)"
                rolpliTitle.font = UIFont(name: "HelveticaNeue", size: 16)
                rolpliTitle.numberOfLines = 0
                rolpliTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                rolpliTitle.sizeToFit()
                
                let addressTitle = UILabel(frame: CGRectMake(5, navBar + 80, width - 10, height))
                addressTitle.textAlignment = NSTextAlignment.Left
                addressTitle.text = "ADDRESS"
                addressTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                addressTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                addressTitle.sizeToFit()
                
                let address = UIButton(frame: CGRect(x: 5, y: navBar + 90, width: width-10, height: 100))
                let addressString = NSMutableAttributedString(string: "River of Life Christian Church\n1177 Laurelwood Road\nSanta Clara, CA 95054", attributes: attributes)
                address.setAttributedTitle(addressString, forState: .Normal)
                address.titleLabel?.numberOfLines = 0
                address.addTarget(self, action: #selector(addressAction), forControlEvents: .TouchUpInside)
                address.sizeToFit()
                
                let emailTitle = UILabel(frame: CGRectMake(5, navBar + 160, width - 10, height))
                emailTitle.textAlignment = NSTextAlignment.Left
                emailTitle.text = "EMAIL"
                emailTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                emailTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                emailTitle.sizeToFit()
                
                let email = UIButton(frame: CGRect(x: 5, y: navBar + 170, width: width-10, height: 20))
                let emailString = NSMutableAttributedString(string: "admission@rolpli.org", attributes: attributes)
                email.setAttributedTitle(emailString, forState: .Normal)
                email.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
                email.sizeToFit()
                
                let phoneTitle = UILabel(frame: CGRectMake(5, navBar + 210, width - 10, height))
                phoneTitle.textAlignment = NSTextAlignment.Left
                phoneTitle.text = "PHONE"
                phoneTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                phoneTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                phoneTitle.sizeToFit()
                
                let phone = UIButton(frame: CGRect(x: 5, y: navBar + 220, width: width-10, height: 20))
                let phoneString = NSMutableAttributedString(string: "408-260-0257 x 300", attributes: attributes)
                phone.setAttributedTitle(phoneString, forState: .Normal)
                phone.addTarget(self, action: #selector(phoneAction), forControlEvents: .TouchUpInside)
                phone.sizeToFit()
                
                let faxTitle = UILabel(frame: CGRectMake(200, navBar + 160, width - 10, height))
                faxTitle.textAlignment = NSTextAlignment.Left
                faxTitle.text = "FAX"
                faxTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                faxTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                faxTitle.sizeToFit()
                
                let fax = UIButton(frame: CGRect(x: 200, y: navBar + 170, width: width-10, height: 20))
                let faxString = NSMutableAttributedString(string: "408-748-8877", attributes: attributes)
                fax.setAttributedTitle(faxString, forState: .Normal)
                fax.addTarget(self, action: #selector(faxAction), forControlEvents: .TouchUpInside)
                fax.sizeToFit()
                
                let webTitle = UILabel(frame: CGRectMake(200, navBar + 210, width - 10, height))
                webTitle.textAlignment = NSTextAlignment.Left
                webTitle.text = "WEBSITE"
                webTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                webTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                webTitle.sizeToFit()
                
                let web = UIButton(frame: CGRect(x: 200, y: navBar + 220, width: width-10, height: 20))
                let webString = NSMutableAttributedString(string: "http://www.rolpli.org/", attributes: attributes)
                web.setAttributedTitle(webString, forState: .Normal)
                web.addTarget(self, action: #selector(webAction), forControlEvents: .TouchUpInside)
                web.sizeToFit()
                
                self.view.addSubview(mainTitle)
                self.view.addSubview(rolpliTitle)
                self.view.addSubview(addressTitle)
                self.view.addSubview(address)
                self.view.addSubview(emailTitle)
                self.view.addSubview(email)
                self.view.addSubview(phoneTitle)
                self.view.addSubview(phone)
                self.view.addSubview(faxTitle)
                self.view.addSubview(fax)
                self.view.addSubview(webTitle)
                self.view.addSubview(web)
            }
        }else{
            if (portrait == false){
                let navBar: CGFloat = 32.0
                
                let mainTitle = UILabel(frame: CGRectMake(5, navBar + 10, width - 10, 50))
                mainTitle.textAlignment = NSTextAlignment.Left
                mainTitle.text = "聯絡資料"
                mainTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                mainTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                mainTitle.sizeToFit()
                
                let rolpliTitle = UILabel(frame: CGRectMake(5, navBar + 40, width - 10, height))
                rolpliTitle.textAlignment = NSTextAlignment.Left
                rolpliTitle.text = "River of Life Pastoral Leadership Institute (ROLPLI)"
                rolpliTitle.font = UIFont(name: "HelveticaNeue", size: 16)
                rolpliTitle.numberOfLines = 0
                rolpliTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                rolpliTitle.sizeToFit()
                
                let addressTitle = UILabel(frame: CGRectMake(5, navBar + 80, width - 10, height))
                addressTitle.textAlignment = NSTextAlignment.Left
                addressTitle.text = "ADDRESS"
                addressTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                addressTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                addressTitle.sizeToFit()
                
                let address = UIButton(frame: CGRect(x: 5, y: navBar + 90, width: width-10, height: 100))
                let addressString = NSMutableAttributedString(string: "River of Life Christian Church\n1177 Laurelwood Road\nSanta Clara, CA 95054", attributes: attributes)
                address.setAttributedTitle(addressString, forState: .Normal)
                address.titleLabel?.numberOfLines = 0
                address.addTarget(self, action: #selector(addressAction), forControlEvents: .TouchUpInside)
                address.sizeToFit()
                
                let emailTitle = UILabel(frame: CGRectMake(5, navBar + 160, width - 10, height))
                emailTitle.textAlignment = NSTextAlignment.Left
                emailTitle.text = "EMAIL"
                emailTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                emailTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                emailTitle.sizeToFit()
                
                let email = UIButton(frame: CGRect(x: 5, y: navBar + 170, width: width-10, height: 20))
                let emailString = NSMutableAttributedString(string: "admission@rolpli.org", attributes: attributes)
                email.setAttributedTitle(emailString, forState: .Normal)
                email.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
                email.sizeToFit()
                
                let phoneTitle = UILabel(frame: CGRectMake(5, navBar + 210, width - 10, height))
                phoneTitle.textAlignment = NSTextAlignment.Left
                phoneTitle.text = "PHONE"
                phoneTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                phoneTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                phoneTitle.sizeToFit()
                
                let phone = UIButton(frame: CGRect(x: 5, y: navBar + 220, width: width-10, height: 20))
                let phoneString = NSMutableAttributedString(string: "408-260-0257 x 300", attributes: attributes)
                phone.setAttributedTitle(phoneString, forState: .Normal)
                phone.addTarget(self, action: #selector(phoneAction), forControlEvents: .TouchUpInside)
                phone.sizeToFit()
                
                let faxTitle = UILabel(frame: CGRectMake(200, navBar + 160, width - 10, height))
                faxTitle.textAlignment = NSTextAlignment.Left
                faxTitle.text = "FAX"
                faxTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                faxTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                faxTitle.sizeToFit()
                
                let fax = UIButton(frame: CGRect(x: 200, y: navBar + 170, width: width-10, height: 20))
                let faxString = NSMutableAttributedString(string: "408-748-8877", attributes: attributes)
                fax.setAttributedTitle(faxString, forState: .Normal)
                fax.addTarget(self, action: #selector(faxAction), forControlEvents: .TouchUpInside)
                fax.sizeToFit()
                
                let webTitle = UILabel(frame: CGRectMake(200, navBar + 210, width - 10, height))
                webTitle.textAlignment = NSTextAlignment.Left
                webTitle.text = "WEBSITE"
                webTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                webTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                webTitle.sizeToFit()
                
                let web = UIButton(frame: CGRect(x: 200, y: navBar + 220, width: width-10, height: 20))
                let webString = NSMutableAttributedString(string: "http://www.rolpli.org/", attributes: attributes)
                web.setAttributedTitle(webString, forState: .Normal)
                web.addTarget(self, action: #selector(webAction), forControlEvents: .TouchUpInside)
                web.sizeToFit()
                
                self.view.addSubview(mainTitle)
                self.view.addSubview(rolpliTitle)
                self.view.addSubview(addressTitle)
                self.view.addSubview(address)
                self.view.addSubview(emailTitle)
                self.view.addSubview(email)
                self.view.addSubview(phoneTitle)
                self.view.addSubview(phone)
                self.view.addSubview(faxTitle)
                self.view.addSubview(fax)
                self.view.addSubview(webTitle)
                self.view.addSubview(web)
            }else{
                let navBar: CGFloat = 44.0
                let mainTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 10, width - 10, 50))
                mainTitle.textAlignment = NSTextAlignment.Left
                mainTitle.text = "聯絡資料"
                mainTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
                mainTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                mainTitle.sizeToFit()
                
                let rolpliTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 40, width - 10, height))
                rolpliTitle.textAlignment = NSTextAlignment.Left
                rolpliTitle.text = "River of Life Pastoral Leadership Institute (ROLPLI)"
                rolpliTitle.font = UIFont(name: "HelveticaNeue", size: 16)
                rolpliTitle.numberOfLines = 0
                rolpliTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                rolpliTitle.sizeToFit()
                
                let addressTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 100, width - 10, height))
                addressTitle.textAlignment = NSTextAlignment.Left
                addressTitle.text = "ADDRESS"
                addressTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                addressTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                addressTitle.sizeToFit()
                
                let address = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 110, width: width-10, height: 100))
                let addressString = NSMutableAttributedString(string: "River of Life Christian Church\n1177 Laurelwood Road\nSanta Clara, CA 95054", attributes: attributes)
                address.setAttributedTitle(addressString, forState: .Normal)
                address.titleLabel?.numberOfLines = 0
                address.addTarget(self, action: #selector(addressAction), forControlEvents: .TouchUpInside)
                address.sizeToFit()
                
                let emailTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 180, width - 10, height))
                emailTitle.textAlignment = NSTextAlignment.Left
                emailTitle.text = "EMAIL"
                emailTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                emailTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                emailTitle.sizeToFit()
                
                let email = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 190, width: width-10, height: 20))
                let emailString = NSMutableAttributedString(string: "admission@rolpli.org", attributes: attributes)
                email.setAttributedTitle(emailString, forState: .Normal)
                email.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
                email.sizeToFit()
                
                let phoneTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 230, width - 10, height))
                phoneTitle.textAlignment = NSTextAlignment.Left
                phoneTitle.text = "PHONE"
                phoneTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                phoneTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                phoneTitle.sizeToFit()
                
                let phone = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 240, width: width-10, height: 20))
                let phoneString = NSMutableAttributedString(string: "408-260-0257 x 300", attributes: attributes)
                phone.setAttributedTitle(phoneString, forState: .Normal)
                phone.addTarget(self, action: #selector(phoneAction), forControlEvents: .TouchUpInside)
                phone.sizeToFit()
                
                let faxTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 280, width - 10, height))
                faxTitle.textAlignment = NSTextAlignment.Left
                faxTitle.text = "FAX"
                faxTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                faxTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                faxTitle.sizeToFit()
                
                let fax = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 290, width: width-10, height: 20))
                let faxString = NSMutableAttributedString(string: "408-748-8877", attributes: attributes)
                fax.setAttributedTitle(faxString, forState: .Normal)
                fax.addTarget(self, action: #selector(faxAction), forControlEvents: .TouchUpInside)
                fax.sizeToFit()
                
                let webTitle = UILabel(frame: CGRectMake(5, statusBarHeight + navBar + 330, width - 10, height))
                webTitle.textAlignment = NSTextAlignment.Left
                webTitle.text = "WEBSITE"
                webTitle.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 14)
                webTitle.textColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                webTitle.sizeToFit()
                
                let web = UIButton(frame: CGRect(x: 5, y: statusBarHeight + navBar + 340, width: width-10, height: 20))
                let webString = NSMutableAttributedString(string: "http://www.rolpli.org/", attributes: attributes)
                web.setAttributedTitle(webString, forState: .Normal)
                web.addTarget(self, action: #selector(webAction), forControlEvents: .TouchUpInside)
                web.sizeToFit()
                
                self.view.addSubview(mainTitle)
                self.view.addSubview(rolpliTitle)
                self.view.addSubview(addressTitle)
                self.view.addSubview(address)
                self.view.addSubview(emailTitle)
                self.view.addSubview(email)
                self.view.addSubview(phoneTitle)
                self.view.addSubview(phone)
                self.view.addSubview(faxTitle)
                self.view.addSubview(fax)
                self.view.addSubview(webTitle)
                self.view.addSubview(web)
            }
        }
        initial = false
    }
    
    func rotated(){
        
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation) && portrait == true){
            portrait = false
            let defaults = NSUserDefaults.standardUserDefaults()
            let option = defaults.stringForKey("menu")
            
            if (option == "新開課程"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                新開課程()
            }else if (option == "學院行事暦"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                學院行事暦()
            }else if (option == "證書班"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                證書班()
            }else if (option == "共同科目"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                共同科目()
            }else if (option == "碩士必修"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                碩士必修()
            }else if (option == "常問問題"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                常問問題()
            }else if (option == "聯絡我們"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                聯絡我們()
            }
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) && portrait == false){
            portrait = true
            let defaults = NSUserDefaults.standardUserDefaults()
            let option = defaults.stringForKey("menu")
            
            if (option == "新開課程"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                新開課程()
            }else if (option == "學院行事暦"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                學院行事暦()
            }else if (option == "證書班"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                證書班()
            }else if (option == "共同科目"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                共同科目()
            }else if (option == "碩士必修"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                碩士必修()
            }else if (option == "常問問題"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                常問問題()
            }else if (option == "聯絡我們"){
                for view in self.view.subviews {
                    view.removeFromSuperview()
                }
                聯絡我們()
            }
        }
    }
    
    func addressAction(sender: UIButton!) {
        let url = NSURL(string: "https://maps.apple.com/maps?address=1177%20Laurelwood%20Rd,%20Santa%20Clara,%20CA%20%2095054,%20United%20States&ll=37.379769,-121.952881&q=1177%20Laurelwood%20Rd,%20Santa%20Clara,%20CA%20%2095054,%20United%20States")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func emailAction(sender: UIButton!) {
        let email = "admission@rolpli.org"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func phoneAction(sender: UIButton!) {
        let number = "4082600257"
        let url = NSURL(string: "tel://\(number)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func faxAction(sender: UIButton!) {
        let number = "4087488877"
        let url = NSURL(string: "tel://\(number)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func webAction(sender: UIButton!) {
        let url = NSURL(string: "http://rolpli.org/joomla/zh")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = array1[indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        performSegueWithIdentifier("showVids", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showVids" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = array1[indexPath.row]
                let controller = (segue.destinationViewController) as! ClassDetail
                controller.name = object
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)){
            initialLandscape = true
            portrait = false
        }else{
            initialLandscape = false
            portrait = true
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DetailViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        initial = true
        
        if (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)){
            initialLandscape = true
            portrait = false
        }else{
            initialLandscape = false
            portrait = true
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let option = defaults.stringForKey("menu")
        
        if (option == "新開課程"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            新開課程()
        }else if (option == "學院行事暦"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            學院行事暦()
        }else if (option == "證書班"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            證書班()
        }else if (option == "共同科目"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            共同科目()
        }else if (option == "碩士必修"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            碩士必修()
        }else if (option == "常問問題"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            常問問題()
        }else if (option == "聯絡我們"){
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            聯絡我們()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

