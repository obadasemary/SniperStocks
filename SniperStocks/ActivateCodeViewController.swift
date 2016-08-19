//
//  ActivateCodeViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/11/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ActivateCodeViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var ActivateCodeTextField: UITextField!
    
    var wSC = webServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        ActivateCodeTextField.attributedPlaceholder = NSAttributedString(string:"كود التفعيل", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        

    }

    @IBAction func ActivateButton(sender: AnyObject) {
        
        wSC._userCode = ActivateCodeTextField.text!
        
        wSC.activedCompteUser(wSC._userName, userCode: wSC._userCode)
        
        
    }
    
    func onActivedCompteUser(result: NSDictionary) {
        
        
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
        
        wSC.sayHello(wSC._userPhone)
        
        performSegueWithIdentifier("CompleteActiveCodeSegue", sender: self)
    }
}
