//
//  MyAccountViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var endDate: UILabel!
    
    var wSC = webServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
//        showEndDate()
    }
    
    @IBAction func ChangePasswordButton(sender: AnyObject) {
        
        performSegueWithIdentifier("ChangePasswordSegue", sender: self)
    }
    
    @IBAction func RequestButton(sender: AnyObject) {
        
    }

    @IBAction func ActivateButton(sender: AnyObject) {
        
    }
    
    func showEndDate() {
        
        let userDateActive = wSC._userDateActive
        let userDateRegister = wSC._userDateRegister
        
        var date = 0
        
        date = Int(userDateActive)! - 6
        
        let dateFormatter = NSDateFormatter()
        
        let dateAsString = userDateActive
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let newDate = dateFormatter.dateFromString(dateAsString)
        
        print(newDate)
        
        print(date)
        
        print("userDateActive: \(userDateActive)")
        print("userDateRegister: \(userDateRegister)")
    }
    
}
