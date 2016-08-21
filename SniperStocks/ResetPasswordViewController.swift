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
        
        if phoneNumber == "" {

            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        } else {
        
            wSC.pwdRecover(phoneNumber!)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
