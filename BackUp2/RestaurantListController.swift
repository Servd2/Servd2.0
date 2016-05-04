//
//  RestaurantListController.swift
//  Servd
//
//  Created by Saul Soto on 3/31/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit

class RestaurantListController: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource, UISearchBarDelegate {
    
    var items = ["Cosi", "SubCo", "FastFood"]
    
    var name: AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
        
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "name")
            
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        filteredData = items
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 165, height: 165) // The size of one cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let frame : CGRect = self.view.frame
        let margin  = (frame.width - 120 * 1) / 16.0
        return UIEdgeInsetsMake(10, margin, 10, margin) // margin between cells
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("reuseCell", forIndexPath: indexPath) as! RestaurantCell
        
        cell.restaurantName?.text = filteredData[indexPath.item]
        
        if(indexPath.item == 0 )
        {
            cell.backgroundColor = UIColor.greenColor()
            
        }
        else if(indexPath.item == 1)
        {
            cell.backgroundColor = UIColor.redColor()
        }
        else
        {
            cell.backgroundColor = UIColor.yellowColor()
        }
        //cell.backgroundColor = UIColor.redColor()
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
            
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        
        name = items[indexPath.row]
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        if searchText.isEmpty {
            filteredData = items
        } else {
            // The user has entered text into the search box
            // Use the filter method to iterate over all items in the data array
            // For each item, return true if the item should be included and false if the
            // item should NOT be included
            filteredData = items.filter({(dataItem: String) -> Bool in
                // If dataItem matches the searchText, return true to include it
                if dataItem.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
                    return true
                } else {
                    return false
                }
            })
        }
        collectionView.reloadData()
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
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


