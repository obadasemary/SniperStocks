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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
