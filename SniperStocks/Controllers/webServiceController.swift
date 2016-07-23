//
//  webServiceController.swift
//  SniperStocks
//
//  Created by Ali Mohamed Kabel on 6/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire

class webServiceController: NSObject
{
    var _parseID = ""
    var _userCode = ""
    var _userID = ""
    var _userName = ""
    var _userPassword = ""
    var _userPhone = ""
    var _userSession = ""

    var resultArray:NSDictionary = NSDictionary()
    var webServiceProtocol: WebServiceProtocol?
    
    func getData(parameters:[String:String])
    {
        
        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
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
    
    func register(userPassword:String, userName:String, userTelephone:String, parseID:String)
    {
        let parameters = ["action":"register",
                          "user_pwd":userPassword,
                          "user_name":userName,
                          "user_tel":userTelephone,
                          "parse_id":parseID]
        
        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
//                    if result["status"] as! String == "success"
//                    {
//                        self._userPassword = userPassword
//                        self._userName = userName
//                        self._userPhone = userTelephone
//                        self._parseID = parseID
//                    }
                    self.webServiceProtocol?.onRegisterSuccess(result as! NSDictionary)
                }
            }

    }
    
    func login(userPassword:String, userName:String, parseID:String)
    {
        let parameters = ["action":"login",
                          "user_password":userPassword,
                          "user_name":userName,
                          "parse_id":parseID]
        
        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
//                    let user = result["user"] as! NSDictionary
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
                    self.webServiceProtocol?.onLoginSuccess(result as! NSDictionary)
                }
        }
        
    }
    
    func getAllCompany(userName:String, userSession:String)
    {
        
        let parameters = ["action":"get_all_company",
                          "user_name":userName,
                          "user_session":userSession]
        
        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
            .responseJSON
            {   response in
                
                if let result = response.result.value
                {
                    self.webServiceProtocol?.onGetAllCompany(result as! NSDictionary)
                }
            }
    }
    
}
