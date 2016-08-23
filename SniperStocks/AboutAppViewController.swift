//
//  AboutAppViewController.swift
//  SniperStocks
//
//  Created by Administrator on 8/24/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SafariServices

class AboutAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showVideoOne(sender: AnyObject) {
        
        if let url = NSURL(string: "https://youtu.be/WCl-WHpH0zk") {
            
            let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(safariController, animated: true, completion: nil)
        } else {
            return
        }
    }

    @IBAction func showVideoTwo(sender: AnyObject) {
        
        if let url = NSURL(string: "https://youtu.be/jnJdXj3P26M") {
            
            let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(safariController, animated: true, completion: nil)
        } else {
            return
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
