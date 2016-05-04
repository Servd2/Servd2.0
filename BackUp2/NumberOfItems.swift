//
//  NumberOfItems.swift
//  DummyServdTest
//
//  Created by Saul Soto on 4/22/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class NumberOfItems: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectItems: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    var itemPrices = 0.00;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.selectItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("numItemsCell")! as UITableViewCell
        
        let cell: NumberOfItemsCell = self.tableView.dequeueReusableCellWithIdentifier("numItemsCell") as! NumberOfItemsCell
        
        //let customCell = self.tableView.dequeueReusableCellWithIdentifier("numItemsCell", forIndexPath: indexPath) as! NumberOfItemsCell
        //let cell = self.tableView.dequeueReusableCellWithIdentifier("numItemsCell", forIndexPath: indexPath) as! NumberOfItemsCell
        
        cell.foodItemName/*textLabel*/?.text = self.selectItems[indexPath.row]
        
        if(cell.foodItemName?.text == "man")
        {
            cell.itemPrice?.text = String("$",2.99)
            itemPrices = 2.99;
        }
        if(cell.foodItemName?.text == "no")
        {
            cell.itemPrice?.text = "$3.99"
            itemPrices = 3.99;
        }
        if(cell.foodItemName?.text == "poop")
        {
            cell.itemPrice?.text = "$4.99"
        }
        if(cell.foodItemName?.text == "compost")
        {
            cell.itemPrice?.text = "$2.99"
            itemPrices = 2.99;
        }
        if(cell.foodItemName?.text == "trash")
        {
            cell.itemPrice?.text = "$3.99"
            itemPrices = 3.99;
        }
        if(cell.foodItemName?.text == "nasty")
        {
            cell.itemPrice?.text = "$4.99"
            itemPrices = 4.99
        }
        if(cell.foodItemName?.text == "taste")
        {
            cell.itemPrice?.text = "$2.99"
            itemPrices = 2.99
        }
        if(cell.foodItemName?.text == "lit")
        {
            cell.itemPrice?.text = "$3.99"
            itemPrices = 3.99
        }
        if(cell.foodItemName?.text == "blimp")
        {
            cell.itemPrice?.text = "$4.99"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            selectItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:  UITableViewRowAnimation.Automatic)
        }
    }
    
    @IBAction func onCashPress(sender: AnyObject) {
        
        let title = "Success!"
        let message = "Credit Card Information Processed - Wait 10-15 min before picking up order"
        let okText = "OK"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:  UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: {action in self.performSegueWithIdentifier("fromCashTick", sender: self)})//nil)
        
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
        
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
