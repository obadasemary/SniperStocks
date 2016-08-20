//
//  Company.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

class Company {
    
    var comp_id: String = ""
    var comp_num: String = ""
    var comp_name: String = ""
    var comp_state: String = ""
    var comp_power: String = ""
    var comp_degre: String = ""
    var comp_uppos_max: String = ""
    var comp_uppos_min: String = ""
    var comp_downneg_max: String = ""
    var comp_downneg_min: String = ""
    var comp_inflation_rate: String = ""
    var comp_pivot_area_min: String = ""
    var comp_pivot_area_max: String = ""
    var IsNotif: String = ""
    var isTri: String = ""
    var notif_this_user: String = ""

    
    init () {
        self.comp_id = ""
        self.comp_num = ""
        self.comp_name = ""
        self.comp_state = ""
        self.comp_power = ""
        self.comp_degre = ""
        self.comp_uppos_max = ""
        self.comp_uppos_min = ""
        self.comp_downneg_max = ""
        self.comp_downneg_min = ""
        self.comp_inflation_rate = ""
        self.comp_pivot_area_min = ""
        self.comp_pivot_area_max = ""
        self.IsNotif = ""
        self.isTri = ""
        self.notif_this_user = ""
    }
}
