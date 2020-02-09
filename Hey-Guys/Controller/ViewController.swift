//
//  ViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signIn", sender: self)
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signUp", sender: self)
        
    }
    
    
    
    
    
    
}

