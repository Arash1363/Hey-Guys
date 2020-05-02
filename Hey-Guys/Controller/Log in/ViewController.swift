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


class ViewController: UIViewController, GIDSignInUIDelegate {
  
    //MARK: - Outlets
    @IBOutlet weak var facebookBlurView: UIVisualEffectView!
    @IBOutlet weak var googleBlurView: UIVisualEffectView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var googleLogin: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        facebookBlurView.layer.cornerRadius = 10
        googleBlurView.layer.cornerRadius = 10
        googleLogin.layer.cornerRadius = 10
       
        //Google Sign in Button Requirement
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.signInSilently()
        
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
    
    @IBAction func googleButton(_ sender: UIButton) {
        
         
    }
    
    //MARK: - Implementation Google Sign In Protocol
    
      func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
          
        if let error = error {
          print("fauled to sign in with error",error)
          return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (result, error) in
            if let error = error {
                print("Failed to sign in with error",error)
                return
            }
        }
      }
      
}//End View Controller Class

