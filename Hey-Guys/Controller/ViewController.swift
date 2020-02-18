//
//  ViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var facebookBlurView: UIVisualEffectView!
    @IBOutlet weak var googleBlurView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        facebookBlurView.layer.cornerRadius = 10
        googleBlurView.layer.cornerRadius = 10
       
        
    }

    //MARK: - Action Methods
    
    @IBAction func signInButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signIn", sender: self)
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signUp", sender: self)
        
    }
    
    //TODO: -  Implimentation Login With Facebook And Google
    
    @IBAction func facebookButton(_ sender: Any) {
        
        
    }
    
    @IBAction func googleButton(_ sender: Any) {
        
        
        
    }
    
    

}//End View Controller Class
