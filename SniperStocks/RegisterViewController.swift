//
//  RegisterViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 7/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, WebServiceProtocol
{

    var webService:webServiceController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.webService = webServiceController.sharedInstance()
        // Do any additional setup after loading the view.
    }
    
    func onRegisterSuccess(result:NSDictionary)
    {
        // Example for how to parse data
        self.webService?._userCode = result["user_code_active"] as! String
    }

    
}
