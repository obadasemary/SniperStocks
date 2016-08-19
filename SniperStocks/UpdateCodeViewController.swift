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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
