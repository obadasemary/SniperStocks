//
//  InstractionViewController.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import NMPopUpViewSwift

class InstractionViewController: UIViewController, WebServiceProtocol, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var companyTableView: UITableView!
    
    var popViewController: PopUpViewControllerSwift!
    
    @IBOutlet weak var showPopupBtn: UIButton!
    
    var wSC = webServiceController()
    var companysArray:NSMutableArray = NSMutableArray()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
        
        wSC.getAllCompany(wSC._userName, userSession: wSC._userSession)
        
        self.setRoundedBorder(5, withBorderWidth: 1, withColor: UIColor(red: 0.0, green: 122.0/2550, blue: 1.0, alpha: 1.0), forButton: showPopupBtn)
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
    
    @IBAction func showGood(sender: AnyObject) {
        
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        //        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        //        {
        //            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: bundle)
        //            self.popViewController.title = "This is a popup view"
        //            self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "You just triggered a great popup window", animated: true)
        //        } else
        //        {
        
        if UIScreen.mainScreen().bounds.size.width > 320 {
            if UIScreen.mainScreen().scale == 3 {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6Plus", bundle: bundle)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "شركة النور", animated: true)
            } else {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "You just triggered a great popup window", animated: true)
            }
        } else {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: bundle)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "You just triggered a great popup window", animated: true)
        }
        
        //        }
    }
    
    func onGetAllCompanySuccess(companies: NSMutableArray)
    {
        
        dispatch_async(dispatch_get_main_queue()) { 
            
            self.companysArray = companies
            self.companyTableView.reloadData()
        }
    }
    
    func setRoundedBorder(radius : CGFloat, withBorderWidth borderWidth: CGFloat, withColor color : UIColor, forButton button : UIButton)
    {
        let l : CALayer = button.layer
        l.masksToBounds = true
        l.cornerRadius = radius
        l.borderWidth = borderWidth
        l.borderColor = color.CGColor
    }
}
