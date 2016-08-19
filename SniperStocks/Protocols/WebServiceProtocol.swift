//
//  WebServiceProtocol.swift
//  SniperStocks
//
//  Created by Ali Mohamed Kabel on 7/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

@objc protocol WebServiceProtocol
{
    optional func onRegisterSuccess(result:NSDictionary)
    optional func onLoginSuccess(result:NSDictionary)
    optional func onGetAllCompanySuccess(result:NSDictionary)
    optional func onSendMoneySuccess(result:NSDictionary)
    optional func onUpdateTelephone(result:NSDictionary)
    optional func onUpdatePassword(result: NSDictionary)
    optional func onsendActiveCode(result: NSDictionary)
    optional func onActivedCompteUser(result: NSDictionary)
    optional func onSayHello(result: NSDictionary)
    optional func onPwdRecover(result: NSDictionary)
    optional func onUpdateNotif(result: NSDictionary)
    optional func onUpdateCode(result: NSDictionary)
}