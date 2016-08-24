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

        self.hideKeyboardWhenTappedAround()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        
        BankNameTextField.attributedPlaceholder = NSAttributedString(string: "اسم البنك", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "رقم الجوال", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    @IBAction func SendMoneyButton(sender: AnyObject) {
        
        let bankName = BankNameTextField.text
        let password = passwordTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        if bankName == "" || password == "" || phoneNumber == "" {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        if password != wSC._userPassword {
            
            let alertController = UIAlertController(title: "Oops", message: "كلمه السر خطأ", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        if phoneNumber != wSC._userPhone {
            
            let alertController = UIAlertController(title: "Oops", message: "رقم الجوال خطا", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
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
