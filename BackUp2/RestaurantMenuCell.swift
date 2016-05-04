//
//  RestaurantMenuCell.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/1/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class RestaurantMenuCell: UITableViewCell {
    var itemPrices = 0.00;

    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
