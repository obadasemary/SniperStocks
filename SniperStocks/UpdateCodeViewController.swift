//
//  UpdateCodeViewController.swift
//  SniperStocks
//
//  Created by Administrator on 8/19/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class UpdateCodeViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var CodeTextField: UITextField!
    
    var wSC = webServiceController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        CodeTextField.attributedPlaceholder = NSAttributedString(string: "كود التفعيل", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    @IBAction func updateCodebutton(sender: AnyObject) {
        
        let code = CodeTextField.text
        
        wSC.updateCode(wSC._userName, userSession: wSC._userSession, code: code!)
    }
    
    func onUpdateCode(result: NSDictionary) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
