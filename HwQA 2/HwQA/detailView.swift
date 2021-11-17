//
//  detailView.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/15/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class detailView: UIViewController {
    
    var Hname = ""
    var l1 = ""
    var l2 = ""
    var l3 = ""
    var l4 = ""
    var l5 = ""
    


    @IBOutlet weak var qaLabal1: UILabel!
    @IBOutlet weak var qaLabel2: UILabel!
    @IBOutlet weak var qaLabel3: UILabel!
    @IBOutlet weak var qaLabel4: UILabel!
    @IBOutlet weak var qaLabel5: UILabel!
    @IBOutlet weak var sg1: UISegmentedControl!
    @IBOutlet weak var sg2: UISegmentedControl!
    @IBOutlet weak var sg3: UISegmentedControl!
    @IBOutlet weak var sg4: UISegmentedControl!
    @IBOutlet weak var sg5: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ชุดที่ \(Hname)"
        qaLabal1.text = l1
        qaLabel2.text = l2
        qaLabel3.text = l3
        qaLabel4.text = l4
        qaLabel5.text = l5
     


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBut(sender: AnyObject) {
        
        var ans1 = 0
        var ans2 = 0
        var ans3 = 0
        var ans4 = 0
        var ans5 = 0

        if(sg1.selectedSegmentIndex == 0){
            
            ans1 = 0
            
        } else {
            
            ans1 = 1
        }
        if(sg2.selectedSegmentIndex == 0){
            
            ans2 = 0
            
        } else {
            
            ans2 = 1
        }
        if(sg3.selectedSegmentIndex == 0){
            
            ans3 = 0
            
        } else {
            
            ans3 = 1
        }
        if(sg4.selectedSegmentIndex == 0){
            
            ans4 = 0
            
        } else {
            
            ans4 = 1
        }
        if(sg5.selectedSegmentIndex == 0){
            
            ans5 = 0
            
        } else {
            
            ans5 = 1
        }
        /*println("ข้อ1 = \(ans1)")
        println("ข้อ2 = \(ans2)")
        println("ข้อ3 = \(ans3)")
        println("ข้อ4 = \(ans4)")
        println("ข้อ5 = \(ans5)")*/
        
        let urlPath = "http://localhost/api/insertA.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        
        request.HTTPMethod = "POST"
        let postString = "set=\(Hname)&ans1=\(ans1)&ans2=\(ans2)&ans3=\(ans3)&ans4=\(ans4)&ans5=\(ans5)"
        // NSLog("%@",postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!
        
        let alert = UIAlertController(title: "Alert", message: "Do you want to finish this question set ? ", preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
        
        (action) -> Void in
            
            self.sg1.selectedSegmentIndex = 0
            self.sg2.selectedSegmentIndex = 0
            self.sg3.selectedSegmentIndex = 0
            self.sg4.selectedSegmentIndex = 0
            self.sg5.selectedSegmentIndex = 0
            self.performSegueWithIdentifier("bb", sender: nil)
        })
        
        let cancle = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: {
        (action) -> Void in
            
        })
        
        alert.addAction(ok)
        alert.addAction(cancle)
        presentViewController(alert, animated: true, completion: nil)
    }



}
