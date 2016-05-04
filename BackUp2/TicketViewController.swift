//
//  TicketViewController.swift
//  Servd
//
//  Created by Saul Soto on 4/12/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {
    @IBOutlet weak var lblGenerator: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        var number = (random()%1000)
        self.lblGenerator.text = String(number)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "listOrderSegue"
        {
        let barVC = segue.destinationViewController as! UITabBarController
        /*let nav = barVC.viewControllers![2] as! UIViewController
        let destinationViewController = nav.topViewController as! OrderListController
        destinationViewController.orderList.append(self.lblGenerator.text!)*/
        }
        /*if segue.identifier == "listOrderSegue" {
            let DVC = self.tabBarController?.viewControllers![1] as! UINavigationController
            //(TabBarController[2]) as! OrderListController
            
            if(DVC.topViewController is OrderListController) {
              var SVC = DVC.topViewController as! OrderListController
                
                let dedupe = self.lblGenerator.text
                
                SVC.orderList.append(self.lblGenerator.text!)
                print(dedupe)
                print(SVC.orderList)
            }
                /*let dedupe = self.lblGenerator.text
                
                DVC.orderList.append(self.lblGenerator.text!)
                print(dedupe)
                print(DVC.orderList)*/
                
        }
        else { print("Id doesnt match with Storyboard segue Id") }
    }*/
    }
    

}
