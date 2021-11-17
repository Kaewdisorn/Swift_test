//
//  ListTableViewController.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/17/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var arrSet:[String] = []
    var arrA1:[String] = []
    var arrA2:[String] = []
    var arrA3:[String] = []
    var arrA4:[String] = []
    var arrA5:[String] = []
    
    var a1 = ""
    var a2 = ""
    var a3 = ""
    var a4 = ""
    var a5 = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Answer List"
        
        let urlPath = "http://localhost/api/getA.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        
        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!
        
        if let jsonObj = NSJSONSerialization.JSONObjectWithData(jsonSource!, options: .MutableContainers, error: nil) as? NSArray{
            
            var sta = ""
            var sta1 = ""
            var sta2 = ""
            var sta3 = ""
            var sta4 = ""
            var sta5 = ""

           // println(jsonObj)
            
            for (var i = 0 ; i < jsonObj.count ; i++){
                
                sta = (jsonObj[i].valueForKey("set") as? String)!
                sta1 = (jsonObj[i].valueForKey("ans1") as? String)!
                sta2 = (jsonObj[i].valueForKey("ans2") as? String)!
                sta3 = (jsonObj[i].valueForKey("ans3") as? String)!
                sta4 = (jsonObj[i].valueForKey("ans4") as? String)!
                sta5 = (jsonObj[i].valueForKey("ans5") as? String)!

                
                arrSet.append(sta)
                arrA1.append(sta1)
                arrA2.append(sta2)
                arrA3.append(sta3)
                arrA4.append(sta4)
                arrA5.append(sta5)

            }
            
            
        } else {
            
            
        }
       /* println(arrSet)
        println(arrA1)
        println(arrA2)
        println(arrA3)
        println(arrA4)
        println(arrA5) */

        
     

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrSet.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var keepT = 0
        var keepF = 0
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "ชุดที่ \(arrSet[indexPath.row])"
        a1 = arrA1[indexPath.row]
        a2 = arrA2[indexPath.row]
        a3 = arrA3[indexPath.row]
        a4 = arrA4[indexPath.row]
        a5 = arrA5[indexPath.row]
        
        if (a1 == "0"){
            
            keepT = keepT + 1
        } else if(a1 == "1") {
            
            keepF = keepF + 1
        }
        if (a2 == "0"){
            
            keepT = keepT + 1
        } else if(a2 == "1") {
            
            keepF = keepF + 1
        }
        if (a3 == "0"){
            
            keepT = keepT + 1
        } else if(a3 == "1") {
            
            keepF = keepF + 1
        }
        if (a4 == "0"){
            
            keepT = keepT + 1
        } else if(a4 == "1") {
            
            keepF = keepF + 1
        }
        if (a5 == "0"){
            
            keepT = keepT + 1
        } else if(a5 == "1") {
            
            keepF = keepF + 1
        }
        cell.detailTextLabel?.text = "ถูก \(keepT) ข้อ ผิด \(keepF) ข้อ"
        /*println(a1)
        println(a2)
        println(a3)
        println(a4)
        println(a5) */

        //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
   

}
