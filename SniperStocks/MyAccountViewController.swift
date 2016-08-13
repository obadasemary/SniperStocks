//
//  MyAccountViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ChangePasswordButton(sender: AnyObject) {
        
        performSegueWithIdentifier("ChangePasswordSegue", sender: self)
    }
    
    @IBAction func RequestButton(sender: AnyObject) {
        
    }

    @IBAction func ActivateButton(sender: AnyObject) {
        
    }
}
