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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wSC = webServiceController.sharedInstance()
        wSC.webServiceProtocol = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = self.companyTableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath) as! InstractionTableViewCell
        
        return tableViewCell
    }
    
}
