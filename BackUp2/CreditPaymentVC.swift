//
//  CreditPaymentVC.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/2/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class CreditPaymentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        switch(indexPath.row) {
        case 0:
                cell = tableView.dequeueReusableCellWithIdentifier("EmailCell", forIndexPath: indexPath) as! EmailCell
            
            return cell
            
            break;
            
        case 1:
                cell = tableView.dequeueReusableCellWithIdentifier("CardNumberCell", forIndexPath: indexPath) as! CardNumberCell
            
            return cell

            break;
            
        case 2:
                cell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as! DateCell
            
            return cell
            
            break;
            
        case 3:
                cell = tableView.dequeueReusableCellWithIdentifier("CVCCell", forIndexPath: indexPath) as! CVCCell
            
            return cell
            
            break;
            
        case 4:
            cell = tableView.dequeueReusableCellWithIdentifier("AmountCell", forIndexPath: indexPath) as! AmountCell
            
            return cell
            
            break;
            
        default:
            break;
        }
        
        return cell
    }

    @IBAction func orderFinal(sender: AnyObject) {
        
        let title = "Success!"
        let message = "Credit Card Information Processed - Wait 10-15 min before picking up order"
        let okText = "OK"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:  UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: {action in self.performSegueWithIdentifier("fromCreditTick", sender: self)})//nil)
        
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
        
        /*let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ticketVC") as! TicketViewController
    
        self.presentViewController(nextViewController, animated:true, completion:nil)*/
        
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
