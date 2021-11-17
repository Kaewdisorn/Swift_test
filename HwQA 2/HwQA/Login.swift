//
//  Login.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/6/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [txtUser .becomeFirstResponder()]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "admin"{
            
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! HomeAsk
            
            targetController.user = txtUser.text
            
        } else if (segue.identifier == "member"){
            
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! HomeResult
        }

    }
    
    @IBAction func login(sender: AnyObject) {
        
        if(txtUser.text == ""){
            
            var alt = UIAlertView(title: "Alert", message: "Username is empty ", delegate: nil, cancelButtonTitle: "OK")
            [txtUser .becomeFirstResponder()]
            alt.show()
        }
            
        else if(txtPass.text == ""){
            
            var alt = UIAlertView(title: "Alert", message: "Password is empty ", delegate: nil, cancelButtonTitle: "OK")
            [txtPass .becomeFirstResponder()]
            alt.show()
        }
        
        else {
            
            [self.check()]
        }
    }
    
    func check(){
        
        let urlPath = "http://localhost/api/login.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        request.HTTPMethod = "POST"
        
        let postString = "username=\(txtUser.text!)&password=\(txtPass.text!)"
        //NSLog("%@",postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!

        if let jsonObj = NSJSONSerialization.JSONObjectWithData(jsonSource!, options: .MutableContainers, error: nil) as? NSArray{
            
            //print(jsonObj)
            
            var sta: String? = jsonObj[0].valueForKey("status") as? String
            var pass: String? = jsonObj[0].valueForKey("password") as? String

            //print(sta)
            
            if(sta == "admin" && pass == "\(txtPass.text)"){
                
                performSegueWithIdentifier("admin", sender: self)
                
            } else if (sta == "member" && pass == "\(txtPass.text)"){
                

                performSegueWithIdentifier("member", sender: self)


            } else {
                
                var alt = UIAlertView(title: "Alert", message: "Incorrect Username or Password", delegate: nil, cancelButtonTitle: "OK")
                alt.show()
                
                txtUser.text = ""
                txtPass.text = ""
                [txtUser .becomeFirstResponder()]
                
                NSLog("not found")
            }
          
        } else {
            
            var alt = UIAlertView(title: "Alert", message: "Incorrect Username or Password", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            txtUser.text = ""
            txtPass.text = ""
            [txtUser .becomeFirstResponder()]
            
            NSLog("not found")
        }
    }
}