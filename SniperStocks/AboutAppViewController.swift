//
//  AboutAppViewController.swift
//  SniperStocks
//
//  Created by Administrator on 8/24/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SafariServices

class AboutAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func showVideoOne(sender: AnyObject) {
        
        performSegueWithIdentifier("showVideoOne", sender: self)
    }

    @IBAction func showVideoTwo(sender: AnyObject) {
        
        performSegueWithIdentifier("showVideoTwo", sender: self)
    }
}
