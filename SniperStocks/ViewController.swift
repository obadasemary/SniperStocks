//
//  ViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 7/31/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let a = webServiceController()
//        a.getData(["action": "get_all_company", "user_name": "obada", "user_session": "57401"])
        
        
    }

    @IBAction func UpdateTelephone(sender: AnyObject) {
        
        let a = webServiceController()
        a.updateTelephone("obada", newUserTelephone: "0097431099515")
        print("UpdateTelephone Success")
    }
    
    @IBAction func UpdatePassword(sender: AnyObject) {
        
        let a = webServiceController()
        a.updatePassword("obada", userPassword: "obada", userSession: "74948")
        print("UpdatePassword Success")
    }
    
    @IBAction func SendActiveCode(sender: AnyObject) {
        
        let a = webServiceController()
        a.sendActiveCode("ali")
        print("SendActiveCode Success")
    }
    
    @IBAction func ActivedCompteUser(sender: AnyObject) {
        
        let a = webServiceController()
        a.activedCompteUser("ali", userCode: "2905")
        print("ActivedCompteUser Success")
    }
    
    @IBAction func SayHello(sender: AnyObject) {
        
        let a = webServiceController()
        a.sayHello("004917668806539")
        print("SayHello Success")
    }
    
    @IBAction func PWDRecover(sender: AnyObject) {
        
        let a = webServiceController()
        a.pwdRecover("0097431099515")
        print("PWDRecover Success")
    }
    
    @IBAction func GetAllCompany(sender: AnyObject) {
        
        let a = webServiceController()
        a.getAllCompany("obada", userSession: "57401")
        print("GetAllCompany Success")
    }
    
    @IBAction func UpdateNotif(sender: AnyObject) {
        
        let a = webServiceController()
        a.updateNotif("2", userName: "obada", parseId: "", userSession: "57401")
        print("UpdateNotif Success")
    }
}
