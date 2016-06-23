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
    func getData(parameters:[String:String])
    {
        Alamofire.request(.POST, "http://snniper.com/api/service.php", parameters: parameters)
            .responseJSON
            { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value
                {
                    print("JSON: \(JSON)")
                }
            }
        
    }
}
