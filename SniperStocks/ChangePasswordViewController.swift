//
//  ChangePasswordViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cPasswordTextField: UITextField!
    
    var wSC = webServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        cPasswordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }

    @IBAction func ChangeButton(sender: AnyObject) {
        
        let password = passwordTextField.text
        let cpassword = cPasswordTextField.text
        
        if password == "" || cpassword == "" {

            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        } else {
            
            if password == cpassword {
                
                wSC._userPassword = password!
                
            } else {
                
                let alertController = UIAlertController(title: "Oops", message: "يجب ان تتطابق كلمتي السر", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return
            }
        }
        
        wSC.updatePassword(wSC._userName, userPassword: wSC._userPassword, userSession: wSC._userSession)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
