//
//  NumberOfItemsCell.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/1/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class NumberOfItemsCell: UITableViewCell {

    @IBOutlet weak var foodItemName: UILabel!
    
    @IBOutlet weak var numItems: UILabel!
    
    @IBOutlet weak var lessButt: UIButton!
    
    @IBOutlet weak var moreButt: UIButton!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    var itemPrices: Double = 0.0
    
    var someValue: Double = 1 {
        didSet {
            numItems.text = "\(someValue)"
        }
    }
    
    var dummyPrice: String = "" {
        didSet {
            dummyPrice = itemPrice.text!
            //totalPrice.text = itemPrice.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func decrementButt(sender: AnyObject) {
        
        if(someValue != 1)
        {
            someValue -= 1
        }
        if(dummyPrice == "2.99")
        {
             itemPrices = Double(someValue) * 2.99;
        }
        if(dummyPrice == "3.99")
        {
            itemPrices = Double(someValue) * 3.99;
        }
        if(dummyPrice == "4.99")
        {
            itemPrices = Double(someValue) * 4.99;
        }
    }
    
    @IBAction func incrementButt(sender: AnyObject) {
        
        if(someValue >= 0 && someValue < 5)
        {
            someValue += 1
        }
    }
    

}
