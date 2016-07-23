//
//  WebServiceProtocol.swift
//  SniperStocks
//
//  Created by Ali Mohamed Kabel on 7/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

protocol WebServiceProtocol
{
    func onRegisterSuccess(result:NSDictionary)
    func onLoginSuccess(result:NSDictionary)
    func onGetAllCompany(result:NSDictionary)

    
    
}