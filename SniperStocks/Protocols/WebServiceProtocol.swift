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
    func onGetAllCompanySuccess(result:NSDictionary)
    func onSendMoneySuccess(result:NSDictionary)
    func onUpdateTelephone(result:NSDictionary)
    func onUpdatePassword(result: NSDictionary)
    func onsendActiveCode(result: NSDictionary)
    func onActivedCompteUser(result: NSDictionary)
    func onSayHello(result: NSDictionary)
    func onPwdRecover(result: NSDictionary)
    func onUpdateNotif(result: NSDictionary)
}