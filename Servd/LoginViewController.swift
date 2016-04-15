//
//  LoginViewController.swift
//  Servd
//
//  Created by Saul Soto on 3/16/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onLogin(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(emailEntered.text!, password: passwordEntered.text!) { (user: PFUser?, error: NSError?) ->
            Void in
            if user != nil {
                print("You're logged in!")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        let newUser = PFUser()
        
        if emailEntered.text == "" || passwordEntered.text == "" {
            print("No username/password inputted")
        }
        else {
            newUser.username = emailEntered.text
            
            newUser.password = passwordEntered.text
        }
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                
                print("Yay, created a user!")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
                
                
            }
            
        }
    }
   
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
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
