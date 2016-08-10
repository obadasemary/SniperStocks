//
//  RegisterViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 7/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, WebServiceProtocol
{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cpasswordTextField: UITextField!
    
    var wSC = webServiceController()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self

        
        usernameTextField.attributedPlaceholder = NSAttributedString(string:"اسم المستخدم", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        phoneTextField.attributedPlaceholder = NSAttributedString(string:"00974 1000 1000", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        cpasswordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    @IBAction func RegisterButton(sender: AnyObject) {
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        let phone = phoneTextField.text
        
        wSC.register(username!, userPassword: password!, userTelephone: phone!, parseID: "")
    }
    
    
    @IBAction func loginButton(sender: AnyObject) {
    }
    
    
    func onRegisterSuccess(result:NSDictionary)
    {
//        // Example for how to parse data
//        wSC._userCode = result["user_code_active"] as! String
        
        wSC._userName = usernameTextField.text!
        
        wSC.sendActiveCode(wSC._userName)
    }

    
}
