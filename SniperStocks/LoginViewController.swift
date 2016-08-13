//
//  LoginViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/3/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    var wSC = webServiceController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let wSC = webServiceController()
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string:"اسم المستخدم", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
        
//        wSC.login("obada", userPassword: "obada", parseID: "")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        
        let username = usernameTextField.text
        wSC._userPassword = passwordTextField.text!
        
        wSC.login(username!, userPassword: wSC._userPassword, parseID: "")
    }

    @IBAction func resetPassword(sender: AnyObject) {
        
        performSegueWithIdentifier("ResetPasswordSegue", sender: self)
    }
    

    func onLoginSuccess(result: NSDictionary) {
        
        wSC._userID = result["user_id"] as! String
        wSC._userName = result["user_name"] as! String
        wSC._userPhone = result["user_phone"] as! String
        wSC._userIsActive = result["user_isActive"] as! String
        wSC._userCode = result["user_code_active"] as! String
        wSC._userDateActive = result["user_date_active"] as! String
        wSC._userDateRegister = result["user_date_register"] as! String
        wSC._userSession = result["user_session"] as! String
        wSC._parseID = result["parse_id"] as! String
        
        print(wSC._userID)
        print(wSC._userName)
        print(wSC._userPhone)
        print(wSC._userIsActive)
        print(wSC._userCode)
        print(wSC._userDateActive)
        print(wSC._userDateRegister)
        print(wSC._userSession)
        print(wSC._parseID)
        
        
        performSegueWithIdentifier("LoginSegue", sender: self)
        
    }
}
