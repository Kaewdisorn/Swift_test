//
//  DetailView2.swift
//  HwQA
//
//  Created by Wongsaphat Praisri on 11/17/15.
//  Copyright (c) 2015 Wongsaphat Praisri. All rights reserved.
//

import UIKit

class DetailView2: UIViewController {

    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    
    var Hname = ""
    var l11 = ""
    var l21 = ""
    var l31 = ""
    var l41 = ""
    var l51 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ชุดที่ \(Hname)"
        l1.text = l11
        l2.text = l21
        l3.text = l31
        l4.text = l41
        l5.text = l51
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
