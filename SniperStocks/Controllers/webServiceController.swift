//
//  webServiceController.swift
//  SniperStocks
//
//  Created by Ali Mohamed Kabel on 6/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire

class webServiceController: NSObject {
    
    let BaseURL = "http://snniper.com/api/service.php"
    
    var _parseID = ""
    var _userCode = ""
    var _userID = ""
    var _userName = ""
    var _userPassword = ""
    var _userPhone = ""
    var _userSession = ""
    var _userIsActive = ""
    var _userDateRegister = ""
    var _userDateActive = ""
    var _bankName = ""

    var resultArray:NSDictionary = NSDictionary()
    var webServiceProtocol: WebServiceProtocol?
    
    // MARK: - getData
    
    func getData(parameters:[String:String]) {
        
        Alamofire.request(.POST, BaseURL, parameters: parameters)
        .responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
    
            self.resultArray = (response.result.value as? NSDictionary)!
            if let JSON = response.result.value {
            
                print("JSON: \(JSON)")
            }
        }
    }
    
    // MARK: - Register
    
    func register(userName:String, userPassword:String, userTelephone:String, parseID:String) {
        
        let parameters = ["action":"register",
                          "user_name":userName,
                          "user_pwd":userPassword,
                          "user_tel":userTelephone,
                          "parse_id":parseID]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
                    
                    guard (result["status"] as! String == "success") else {
                        print("Error")
                        return
                    }
                
//                    if result["status"] as! String == "success"
//                    {
//                        self._userPassword = userPassword
//                        self._userName = userName
//                        self._userPhone = userTelephone
//                        self._parseID = parseID
//                    }
                    
                    self.webServiceProtocol?.onRegisterSuccess!(result as! NSDictionary)
                }
            }

    }
    
    // MARK: - Login
    
    func login(userName:String, userPassword:String, parseID:String)
    {
        let parameters = ["action":"login",
                          "user_name":userName,
                          "user_password":userPassword,
                          "parse_id":parseID]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
                    if(result["status"] as! String == "success")
                    {
                        let user = result["user"] as! NSDictionary
                        
                        let status = result["status"] as! String
                        
                        if status == "success" {
                            
                            self.webServiceProtocol?.onLoginSuccess!(user )
                            
                            print("Login Success")
                        } else {
                            print("Login Error")
                            return
                        }
                        
                        
    //                    guard (result["status"] as! String == "success") else {
    //                        print("Login Error")
    //                        return
    //                    }
                        
    //                    if user["user_name"] as! String == userName
    //                    {
    //                        self._userPassword = userPassword
    //                        self._userName = userName
    //                        self._parseID = parseID
    //                        self._userCode = user["user_code_active"] as! String
    //                        self._userPhone = user["user_phone"] as! String
    //                        self._userSession = user["user_session"] as! String
    //                        self._userID = user["user_id"] as! String
    //                    }
    //                    self.webServiceProtocol?.onLoginSuccess!(user )
    //                    
    //                    print("Login Success")
                    }
                    else
                    {
                        self.webServiceProtocol?.onLoginFailed!()
                    }
                }
        }
        
    }
    
    // MARK: - Get All Company
    
    func getAllCompany(userName:String, userSession:String)
    {
        
        let parameters = ["action":"get_all_company",
                          "user_name":userName,
                          "user_session":userSession]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters)
            .responseJSON
            {   response in
                let companiesArray:NSMutableArray = NSMutableArray()
                if let result = response.result.value
                {
                    
                    if (result["status"] as! String == "success")
                    {
                        let companiesResult = result["company"] as! NSArray
                        for companyItem in companiesResult
                        {
                            let companyDictionary = companyItem as! NSDictionary
                            let company:Company = Company()
                            company.comp_id = companyDictionary["comp_id"] as! String
                            company.comp_num = companyDictionary["comp_num"] as! String
                            company.comp_name = companyDictionary["comp_name"] as! String
                            company.comp_state = companyDictionary["comp_state"] as! String
                            company.comp_power = companyDictionary["comp_power"] as! String
                            company.comp_degre = companyDictionary["comp_degre"] as! String
                            company.comp_uppos_max = companyDictionary["comp_uppos_max"] as! String
                            company.comp_uppos_min = companyDictionary["comp_uppos_min"] as! String
                            company.comp_downneg_max = companyDictionary["comp_downneg_max"] as! String
                            company.comp_downneg_min = companyDictionary["comp_downneg_min"] as! String
                            company.comp_inflation_rate = companyDictionary["comp_inflation_rate"] as! String
                            company.comp_pivot_area_min = companyDictionary["comp_pivot_area_min"] as! String
                            company.comp_pivot_area_max = companyDictionary["comp_pivot_area_max"] as! String
                            company.IsNotif = companyDictionary["IsNotif"] as! String
                            company.isTri = companyDictionary["isTri"] as! String
                            company.notif_this_user = companyDictionary["notif_this_user"] as! String
                            
                            companiesArray.addObject(company)
                        }
                    }
                    
                    self.webServiceProtocol?.onGetAllCompanySuccess!(companiesArray)
                }
            }
    }
    
    // MARK: - Send Money
    
    func sendMoney(userName:String, userSession:String, bankName:String, userTelephone:String, userPassword:String)
    {
        
        let parameters = ["action":"send_money",
                          "name_bank":bankName,
                          "user_name":userName,
                          "user_tel":userTelephone,
                          "user_psd":userPassword,
                          "user_session":userSession]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
                    self.webServiceProtocol?.onSendMoneySuccess!(result as! NSDictionary)
                }
        }
    }
    
    // MARK: - Update Telephone
    
    func updateTelephone(userName: String, newUserTelephone: String) {
        
        let parameters = ["action":"update_tel",
                          "user_name":userName,
                          "user_tel":newUserTelephone]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
            if let result = response.result.value {
                self.webServiceProtocol?.onUpdateTelephone!(result as! NSDictionary)
            }
        }
    }
    
    // MARK: - Update Password
    
    func updatePassword(userName: String, userPassword: String, userSession: String) {
        
        let parameters = ["action": "update_password",
                          "user_name": userName,
                          "user_pwd": userPassword,
                          "user_session": userSession]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
//            if let result = response.result.value {
//                
//                self.webServiceProtocol?.onUpdatePassword!(result as! NSDictionary)
//            }
        }
    }

    // MARK: - Send Active Code 
    
    func sendActiveCode(userName: String) {
        
        let parameters = ["action": "send_active_code",
                          "user_name": userName]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
//            if let result = response.result.value {
//                
//                self.webServiceProtocol?.onsendActiveCode!(result as! NSDictionary)
////                print(result)
//            }
        }
    }
    
    // MARK: - Actived Complete User
    
    func activedCompteUser(userName: String, userCode: String) {
        
        let parameters = ["action": "actived_compte_user",
                          "user_name": userName,
                          "user_code": userCode]
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
            if let result = response.result.value {
                
                let user = result["user"] as! NSDictionary
                
                let status = result["status"] as! String
                
                if status == "success" {
                    
                    self.webServiceProtocol?.onActivedCompteUser!(user )
                    
                    print("ActivedCompteUser Success")
                } else {
                    print("ActivedCompteUser Error")
                }
            }
        }
    }
    
    // MARK: - Say Hello
    
    func sayHello(userTelephone: String) {
        
        let parameters = ["action": "say_hello", "user_tel": userTelephone]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
//            if let result = response.result.value {
//                
//                self.webServiceProtocol?.onSayHello!(result as! NSDictionary)
//            }
        }
    }
    
    // MARK: - PWD Recover
    
    func pwdRecover(userTelephone: String) {
        
        let parameters = ["action": "pwd_recover", "user_tel": userTelephone]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
//            if let result = response.result.value {
//                
//                self.webServiceProtocol?.onPwdRecover!(result as! NSDictionary)
//            }
        }
    }
    
    // MARK: - Update Notif
    
    func updateNotif(compId: String, userName: String, parseId: String, userSession: String) {
        
        let parameters = ["action": "update_notif", "comp_id": compId, "user_name": userName, "parse_id": parseId, "user_session": userSession]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
            if let result = response.result.value {
                
                self.webServiceProtocol?.onUpdateNotif!(result as! NSDictionary)
            }
        }
    }
    
    // MARK: - Update Code
    
    func updateCode(userName: String, userSession: String, code: String) {
        
        let parameters = ["action": "update_code", "user_name": userName, "user_session": userSession, "code": code]
        
        Alamofire.request(.POST, BaseURL, parameters: parameters).responseJSON { (response) in
            
            if let result = response.result.value {
                
                self.webServiceProtocol?.onUpdateCode!(result as! NSDictionary)
            }
        }
    }

    // MARK: - Shared Instance
    
    class func sharedInstance() -> webServiceController {
        
        struct Singleton {
            static var sharedInstance = webServiceController()
        }
        
        return Singleton.sharedInstance
    }
    
//    func showError(title:String, message: String) {
//        
//        let optionMenu = UIAlertController(title: title, message: message, preferredStyle: .Alert)
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        // Display the menu
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
}
