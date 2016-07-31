//
//  ViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 7/31/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func UpdateTelephone(sender: AnyObject) {
        
        let a = webServiceController()
        a.updateTelephone("obada", newUserTelephone: "31099515")
    }
}
