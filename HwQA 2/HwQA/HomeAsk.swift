//
//  HomeAsk.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/11/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class HomeAsk: UIViewController {

    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    var user = ""
    var numC = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [txt1 .becomeFirstResponder()]
        let urlPath = "http://localhost/api/selectQ.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)

        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!
        
        if let jsonObj = NSJSONSerialization.JSONObjectWithData(jsonSource!, options: .MutableContainers, error: nil) as? NSArray{
            
            //println(jsonObj)
            var sta = ""            
            for (var i = 0 ; i < jsonObj.count ; i++){
                
                sta = (jsonObj[i].valueForKey("set") as? String)!
            }
            //var sta: String? = jsonObj[0].valueForKey("set") as? String
            //println(sta)
            var num = sta.toInt()
            var num2 = num! + 1
            numC = String(num2)
            setLabel.text = "ชุดที่ \(numC)"

            
        } else {
            
            setLabel.text = "ชุดที่ 1"
            numC = "1"
        }

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveaction(sender: AnyObject) {
        
        let urlPath = "http://localhost/api/insertQ.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        
        request.HTTPMethod = "POST"
        
        let postString = "set=\(numC)&qa1=\(txt1.text)&qa2=\(txt2.text)&qa3=\(txt3.text)&qa4=\(txt4.text)&qa5=\(txt5.text)&username=\(user)"
        
       // NSLog("%@",postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!

        let actionA: UIAlertController = UIAlertController(title: "Alert", message: "Do you want to add this set question ?", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            [self .viewDidLoad()]
            self.txt1.text = ""
            self.txt2.text = ""
            self.txt3.text = ""
            self.txt4.text = ""
            self.txt5.text = ""
            [self.txt1 .becomeFirstResponder()]
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            
        }
        actionA.addAction(ok)
        actionA.addAction(cancel)
        presentViewController(actionA, animated: true, completion: nil)
    }


}
