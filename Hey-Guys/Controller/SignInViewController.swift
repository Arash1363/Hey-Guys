//
//  SignInViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func continueButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToHome", sender: self)
        
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToSignUp", sender: self)
        
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
