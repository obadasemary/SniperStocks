//
//  InstractionViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class InstractionViewController: UIViewController, WebServiceProtocol, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerTableView: UIView!
    @IBOutlet weak var companyTableView: UITableView!
    
    var wSC = webServiceController()
    var companysArray:NSMutableArray = NSMutableArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        wSC.getAllCompany(wSC._userName, userSession: wSC._userSession)
        
        self.companyTableView.tableHeaderView = headerTableView
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.companysArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = self.companyTableView.dequeueReusableCellWithIdentifier("CompanyCell",forIndexPath: indexPath) as! InstractionTableViewCell
        
        let company = companysArray[indexPath.row] as! Company
        tableViewCell.Company.text = company.comp_name
//        tableViewCell.Case
        tableViewCell.Power.text = company.comp_power
//        tableViewCell.Appreciation.progress = companysArray[indexPath.row].comp_degre
        let degreeFloatValue = (company.comp_degre as NSString).floatValue 
        tableViewCell.Appreciation.setProgress(degreeFloatValue/100, animated: true)
        tableViewCell.companyNumber.text = company.comp_num
        let rate = degreeFloatValue/100
        tableViewCell.progressViewRate.text = NSString(format: "%.2f", rate) as String + String("%")
        if company.comp_state == "0"
        {
           tableViewCell.Case.image = UIImage(named: "redDot")
            tableViewCell.Appreciation.tintColor = UIColor.redColor()
            tableViewCell.progressViewRate.textColor = UIColor.redColor()
        }
        else if company.comp_state == "1"
        {
            tableViewCell.Case.image = UIImage(named: "grayDot")
            tableViewCell.Appreciation.tintColor = UIColor.whiteColor()
            tableViewCell.progressViewRate.textColor = UIColor.whiteColor()
        }
        else
        {
            tableViewCell.Case.image = UIImage(named: "greenDot")
            tableViewCell.Appreciation.tintColor = UIColor.greenColor()
            tableViewCell.progressViewRate.textColor = UIColor.greenColor()
        }
        
        
        return tableViewCell
    }
    
    func onGetAllCompanySuccess(companies: NSMutableArray)
    {
        
        dispatch_async(dispatch_get_main_queue()) { 
            
            self.companysArray = companies
            self.companyTableView.reloadData()
        }
    }
}
