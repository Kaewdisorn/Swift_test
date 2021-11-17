//
//  List2TableViewController.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/17/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class List2TableViewController: UITableViewController {
    
    
    var arrSet:[String] = []
    var arrq1:[String] = []
    var arrq2:[String] = []
    var arrq3:[String] = []
    var arrq4:[String] = []
    var arrq5:[String] = []
    
    var setName = ""
    var qa1 = ""
    var qa2 = ""
    var qa3 = ""
    var qa4 = ""
    var qa5 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlPath = "http://localhost/api/getQ.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        
        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!
        
        if let jsonObj = NSJSONSerialization.JSONObjectWithData(jsonSource!, options: .MutableContainers, error: nil) as? NSArray{
            
            //NSLog("%@", jsonObj)
            var sta = ""
            var sta1 = ""
            var sta2 = ""
            var sta3 = ""
            var sta4 = ""
            var sta5 = ""
            
            for (var i = 0 ; i < jsonObj.count ; i++){
                
                sta = (jsonObj[i].valueForKey("set") as? String)!
                sta1 = (jsonObj[i].valueForKey("qa1") as? String)!
                sta2 = (jsonObj[i].valueForKey("qa2") as? String)!
                sta3 = (jsonObj[i].valueForKey("qa3") as? String)!
                sta4 = (jsonObj[i].valueForKey("qa4") as? String)!
                sta5 = (jsonObj[i].valueForKey("qa5") as? String)!
                
                arrSet.append(sta)
                arrq1.append(sta1)
                arrq2.append(sta2)
                arrq3.append(sta3)
                arrq4.append(sta4)
                arrq5.append(sta5)
            }
            
        } else {
            
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrSet.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "ชุดที่ \(arrSet[indexPath.row])"
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        setName = arrSet[indexPath.row]
        qa1 = arrq1[indexPath.row]
        qa2 = arrq2[indexPath.row]
        qa3 = arrq3[indexPath.row]
        qa4 = arrq4[indexPath.row]
        qa5 = arrq5[indexPath.row]
        
        //println(setName)
        performSegueWithIdentifier("detail", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail"{
            
            var vc = segue.destinationViewController as! DetailView2
            vc.Hname = setName
            vc.l11 = qa1
            vc.l21 = qa2
            vc.l31 = qa3
            vc.l41 = qa4
            vc.l51 = qa5
        }
    }


}
