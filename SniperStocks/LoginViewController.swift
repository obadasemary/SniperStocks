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
        let password = passwordTextField.text
        
        wSC.login(username!, userPassword: password!, parseID: "")
    }

    @IBAction func resetPassword(sender: AnyObject) {
    }
    

    func onLoginSuccess(result: NSDictionary) {
        
//        self.wSC._userSession = result["user_session"] as! String
        wSC._userSession = result["user_session"] as! String
        print(wSC._userSession)
        
        
//        "user_name": "obada",
//        "user_phone": "0097431099515",
//        "user_password": "95b06691f8c5b6fefeccfce368201522",
//        "user_isActive": "1",
//        "user_code_active": "3115",
//        "user_date_active": "5",
//        "user_date_register": "01-08-2016 15:38",
//        "user_session": "93237",
//        "parse_id": ""
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
