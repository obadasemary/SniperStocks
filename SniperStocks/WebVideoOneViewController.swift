//
//  WebVideoOneViewController.swift
//  SniperStocks
//
//  Created by Administrator on 8/24/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class WebVideoOneViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://youtu.be/WCl-WHpH0zk") {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        } else {
            return
        }
    }
}
