//
//  ViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {

    //MARK: - Outlets
    @IBOutlet weak var facebookBlurView: UIVisualEffectView!
    @IBOutlet weak var googleBlurView: UIVisualEffectView!

    @IBOutlet weak var googleSignIn: GIDSignInButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        facebookBlurView.layer.cornerRadius = 10
        googleBlurView.layer.cornerRadius = 10
       
        //Google Sign in Button Requirement
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // ...
        
    }

    //MARK: - Action Methods
    
    @IBAction func signInButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signIn", sender: self)
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signUp", sender: self)
        
    }
    
    //TODO: -  Implementation Login With Facebook And Google
    
    @IBAction func facebookButton(_ sender: Any) {
        
        
    }
    
    @IBAction func googleButton(_ sender: GIDSignInButton) {
        
         
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            
             print(error)
            
        }
    }

}//End View Controller Class
