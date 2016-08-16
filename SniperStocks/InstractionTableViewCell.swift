//
//  InstractionTableViewCell.swift
//  SniperStocks
//
//  Created by Abdelrahman Mohamed on 8/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class InstractionTableViewCell: UITableViewCell {

    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Company: UILabel!
    @IBOutlet weak var Case: UIImageView!
    @IBOutlet weak var Power: UILabel!
    @IBOutlet weak var Appreciation: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
