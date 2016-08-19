//
//  InstractionViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class InstractionViewController: UIViewController, WebServiceProtocol, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var companyTableView: UITableView!
    
    var wSC = webServiceController()
    var companysArray = [Company]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        wSC.getAllCompany(wSC._userName, userSession: wSC._userSession)
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.companysArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = self.companyTableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath) as! InstractionTableViewCell
        
        tableViewCell.Company.text = companysArray[indexPath.row].comp_name
//        tableViewCell.Case
        tableViewCell.Power.text = companysArray[indexPath.row].comp_power
//        tableViewCell.Appreciation.progress = companysArray[indexPath.row].comp_degre
        
        
        
        
        return tableViewCell
    }
    
    func onGetAllCompanySuccess(result: NSDictionary) {
        
        dispatch_async(dispatch_get_main_queue()) { 
            
//            self.companyTableView = 
//            self.companysArray
        }
    }
}
