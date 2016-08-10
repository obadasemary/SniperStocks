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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
