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
        
        wSC._userPassword = passwordTextField.text!
        
        wSC.updatePassword(wSC._userName, userPassword: wSC._userPassword, userSession: wSC._userSession)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
