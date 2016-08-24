//
//  RegisterViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 7/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, WebServiceProtocol {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cpasswordTextField: UITextField!
    
    var wSC = webServiceController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self

        usernameTextField.attributedPlaceholder = NSAttributedString(string:"اسم المستخدم", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        phoneTextField.attributedPlaceholder = NSAttributedString(string:"رقم الجوال", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        cpasswordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    @IBAction func RegisterButton(sender: AnyObject) {
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        let phone = phoneTextField.text
        let cpassword = cpasswordTextField.text
        
        if username == "" || password == "" || phone == "" || cpassword == "" {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        if password == cpassword {
            
            wSC._userPassword = password!
            
        } else {
            
            let alertController = UIAlertController(title: "Oops", message: "يجب ان تكون كلمات السر متطابقه", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        wSC.register(username!, userPassword: wSC._userPassword, userTelephone: phone!, parseID: "")
    }
    
    
    @IBAction func loginButton(sender: AnyObject) {
    }
    
    
    func onRegisterSuccess(result:NSDictionary)
    {
        
        wSC._userName = usernameTextField.text!
        
        wSC.sendActiveCode(wSC._userName)
        
        performSegueWithIdentifier("ActiveCodeSegue", sender: self)
    }

    
    
}
