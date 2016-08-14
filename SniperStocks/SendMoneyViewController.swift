//
//  SendMoneyViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class SendMoneyViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var BankNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    var wSC = webServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        
        BankNameTextField.attributedPlaceholder = NSAttributedString(string: "اسم البنك", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "رقم الجوال", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    @IBAction func SendMoneyButton(sender: AnyObject) {
        
        wSC._bankName = BankNameTextField.text!
        
        wSC.sendMoney(wSC._userName, userSession: wSC._userSession, bankName: wSC._bankName, userTelephone: wSC._userPhone, userPassword: wSC._userPassword)
    }
    
    func onSendMoneySuccess(result: NSDictionary) {
        
        let status = result["status"] as! String
        
        print(status)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}