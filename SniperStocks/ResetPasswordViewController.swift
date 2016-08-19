//
//  ResetPasswordViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    var wSC = webServiceController()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "رقم الجوال", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }

    @IBAction func ResetPasswordButton(sender: AnyObject) {
        
        let phoneNumber = phoneNumberTextField.text
        
        wSC.pwdRecover(phoneNumber!)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
