//
//  Regis.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/4/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class Regis: UIViewController {

    @IBOutlet weak var txtuser: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtrepass: UITextField!
    @IBOutlet weak var txtfirest: UITextField!
    @IBOutlet weak var txtlast: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txttel: UITextField!
    @IBOutlet weak var smv: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [txtuser .becomeFirstResponder()]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func comfirm(sender: AnyObject) {
        
        if(txtuser.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Username is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            [txtuser .becomeFirstResponder()]
        }
        else if (txtpassword.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Password is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            [txtpassword .becomeFirstResponder()]
        }
        else if (txtrepass.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Re-password is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            [txtrepass .becomeFirstResponder()]
        }
        else if (txtfirest.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Firstname is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            [txtfirest .becomeFirstResponder()]
        }
        else if(txtlast.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Lastname is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            [txtlast .becomeFirstResponder()]
        }
        else if (txtemail.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Password is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            [txtemail .becomeFirstResponder()]
        }
        else if(txttel.text == ""){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Password is empty !", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            [txttel .becomeFirstResponder()]
        }
        else if(txtpassword.text != txtrepass.text){
            
            var alt = UIAlertView(title: "Alert!!!", message: "Password not match!", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            txtpassword.text = ""
            txtrepass.text = ""
            [txtpassword .becomeFirstResponder()]
        }
        else if(txtpassword.text == txtrepass.text){
            
            [self .intodata()]
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    func intodata(){
        

        let urlPath = "http://localhost/api/register.php"
        let jsonURL: NSURL = NSURL(string: urlPath)!
        let request = NSMutableURLRequest(URL: jsonURL)
        request.HTTPMethod = "POST"

        var status = ""
        if(smv.selectedSegmentIndex == 0){
            
            status = "admin"
            
        } else {
            
            status = "member"
        }
        
        let postString = "username=\(txtuser.text!)&password=\(txtpassword.text!)&name=\(txtfirest.text!)&surname=\(txtlast.text!)&email=\(txtemail.text!)&tel=\(txttel.text!)&status=\(status)"
        
        //NSLog("PostData: %@",postString);
        
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
      let respond:AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
       var jsonSource:NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: respond, error: nil)!

        if let jsonObj = NSJSONSerialization.JSONObjectWithData(jsonSource!, options: .MutableContainers, error: nil) as? NSArray{
            
            var alt = UIAlertView(title: "Alert", message: "Username register already !!!", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            
            txtuser.text = ""
            [txtuser .becomeFirstResponder()]
            
        } else {
            
            var alt = UIAlertView(title: "Alert", message: "SUCCESS !!!", delegate: nil, cancelButtonTitle: "OK")
            alt.show()
            txtuser.text = ""
            txtpassword.text = ""
            txtrepass.text = ""
            txtfirest.text = ""
            txtlast.text = ""
            txtemail.text = ""
            txttel.text = ""    
            [self .performSegueWithIdentifier("confirm", sender: nil)]
            
        }

        
    }

}
