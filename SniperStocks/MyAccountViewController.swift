//
//  MyAccountViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, WebServiceProtocol {

    @IBOutlet weak var endDate: UILabel!
    
    var wSC = webServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        

        let currentDate = NSDate()
        let userDateActive = Int(wSC._userDateActive)
        
        let daysActivate = userDateActive
        let daysa = daysActivate
        var mo = 0
        var da = 0
        
        if daysActivate >= 30 {
            
            let moms = daysActivate! / 30
            mo = moms
            let res = moms * 30
            let bac = daysa! - res
            da = bac
        } else {
            
            da = daysActivate!
            mo = 0
        }
        
        
        let monthsToAdd = mo
        let daysToAdd = da
        
        //        var calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Month, value: monthsToAdd, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        //        calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: daysToAdd, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        
        
        let newDateComponents = NSDateComponents()
        newDateComponents.month = monthsToAdd
        newDateComponents.day = daysToAdd
        
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingComponents(newDateComponents, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy - MM - dd"
        let convertedDate = dateFormatter.stringFromDate(calculatedDate!)
        
        endDate.text = "\(convertedDate)"
    }
    
    @IBAction func ChangePasswordButton(sender: AnyObject) {
        
        performSegueWithIdentifier("ChangePasswordSegue", sender: self)
    }
    
    @IBAction func RequestButton(sender: AnyObject) {
        
    }

    @IBAction func ActivateButton(sender: AnyObject) {
        
    }
    
    func showEndDate() {
        
        let currentDate = NSDate()
        let userDateActive = Int(wSC._userDateActive)
        
        let daysActivate = userDateActive
        let daysa = daysActivate
        var mo = 0
        var da = 0
        
        if daysActivate >= 30 {
            
            let moms = daysActivate! / 30
            mo = moms
            let res = moms * 30
            let bac = daysa! - res
            da = bac
        }
        
        
        let monthsToAdd = mo
        let daysToAdd = da
        
//        var calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Month, value: monthsToAdd, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
//        calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: daysToAdd, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        
        
        let newDateComponents = NSDateComponents()
        newDateComponents.month = monthsToAdd
        newDateComponents.day = daysToAdd
        
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingComponents(newDateComponents, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        
        print(calculatedDate)
        
        
        
        
//        let userDateRegister = wSC._userDateRegister
//        
//        var date = 0
//        
//        date = Int(userDateActive)! - 6
//        
//        let dateFormatter = NSDateFormatter()
//        
//        let dateAsString = userDateActive
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
//        let newDate = dateFormatter.dateFromString(dateAsString)
//        
//        print(newDate)
//        
//        print(date)
//        
//        print("userDateActive: \(userDateActive)")
//        print("userDateRegister: \(userDateRegister)")
    }
    
}
