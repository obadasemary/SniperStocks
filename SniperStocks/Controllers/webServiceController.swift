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
    func test()
    {
        let parameters =
            [
                "action": "login",
                "user_name": "obada",
                "user_password": "obada"
        ]

        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
        .responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
    
        if let JSON = response.result.value {
        
            print("JSON: \(JSON)")
        }
    }
        
//        let headers = [
//            "Content-Type": "application/x-www-form-urlencoded",
//            "Accept": "application/json"
//        ]
//        
//        Alamofire.request(.POST,
//                          "http://snniper.com/api/service.php", parameters: parameters, encoding: . URLEncodedInURL, headers: headers).response
//        { request, response, data, error in
//            print(request)
//            print(response)
//            print(data)
//            print(error)
//            let dataString = NSString(data: data!, encoding:NSUTF8StringEncoding)
//            print(dataString)
//        }
}
}
