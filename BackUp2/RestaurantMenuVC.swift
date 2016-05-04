//
//  RestaurantMenuVC.swift
//  DummyServdTest
//
//  Created by Saul Soto on 4/21/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class RestaurantMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let customGreen: UIColor = UIColor(red: 0.251, green: 0.831, blue: 0.494, alpha: 1)
    
    @IBOutlet weak var restName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var orderButt: UIButton!
    
    var arr:[String] = ["compost", "trash", "nasty"]
    
    var completed = false
    
    var name: AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
    }

    var pressedItems: [String] = []
    //var itemPrices: [String] = ["2.99", "3.99", "4.99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        orderButt.hidden = true
        
        restName.text = name as? String
        
        //print((restName.text)!)
        if(restName.text == "SubCo"){
            arr = ["man", "no", "poop"]
        }
            
        else if(restName.text == "FastFood"){
            arr = ["taste", "lit", "blimp"]
        }

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("menuCell")! as UITableViewCell
        
        let cell: RestaurantMenuCell = self.tableView.dequeueReusableCellWithIdentifier("menuCell") as! RestaurantMenuCell
        
        cell.itemName?.text = self.arr[indexPath.row]
        
        if(cell.itemName?.text == "man")
        {
            cell.itemPrice?.text = "$2.99"
        }
        if(cell.itemName?.text == "no")
        {
            cell.itemPrice?.text = "$3.99"
        }
        if(cell.itemName?.text == "poop")
        {
            cell.itemPrice?.text = "$4.99"
        }
        if(cell.itemName?.text == "compost")
        {
            cell.itemPrice?.text = "$2.99"
        }
        if(cell.itemName?.text == "trash")
        {
            cell.itemPrice?.text = "$3.99"
        }
        if(cell.itemName?.text == "nasty")
        {
            cell.itemPrice?.text = "$4.99"
        }
        if(cell.itemName?.text == "taste")
        {
            cell.itemPrice?.text = "$2.99"
        }
        if(cell.itemName?.text == "lit")
        {
            cell.itemPrice?.text = "$3.99"
        }
        if(cell.itemName?.text == "blimp")
        {
            cell.itemPrice?.text = "$4.99"
        }

        return cell
    }
    
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        orderButt.hidden = false;
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! RestaurantMenuCell//UITableViewCell
        
        //completed = !completed
        if (currentCell.accessoryType == UITableViewCellAccessoryType.None)/*completed == false*/ {
            currentCell.backgroundColor = customGreen
            currentCell.tintColor = UIColor.whiteColor()
            currentCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            //completed = true
            pressedItems.append(currentCell.itemName/*textLabel*/!.text!)
        }
        else {
            currentCell.backgroundColor = UIColor.whiteColor()
            currentCell.accessoryType = UITableViewCellAccessoryType.None
            
            //completed = false
            
            let itemtoRemove = currentCell.itemName!.text!
            //print("\(itemName)")
            /*if(pressedItems.count == 0){
                orderButt.hidden = true;
            }*/
            
            while pressedItems.contains(itemtoRemove)
            {
                if let itemToRemoveIndex = pressedItems.indexOf(itemtoRemove) {
                    pressedItems.removeAtIndex(itemToRemoveIndex)
                }
            }
            if(pressedItems.count > 0){
                orderButt.hidden = false;
            }else if (pressedItems.count==0){
                orderButt.hidden = true;
            }
            
            //_ = pressedItems.filter() {$0 != "\(itemName)"}
            
        }
        
        print(pressedItems)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "foodSelectVC" {
            if let DVC = segue.destinationViewController as? NumberOfItems{
                
                let dedupe = removeDuplicates(pressedItems)
                print(dedupe)
                
                DVC.selectItems = dedupe
            } else {
                print("Data NOT Passed! destination vc is not set to firstVC")
            }
        } else { print("Success") }
    }

}

