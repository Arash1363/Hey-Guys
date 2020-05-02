//
//  SignInViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

class SignInViewController: UIViewController , UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var passwordResetView: UIView!
    
    @IBOutlet weak var emailPasswordReset: UITextField!
    
    //MARK: - Variable
    let hud = JGProgressHUD(style: .light)
    var alert : UIAlertController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailPasswordReset.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        //Set Blur View Equal To Fit Screen
        blurView.bounds = self.view.bounds
        
        //Set Password Reset View Widh Equal To 90% Widh Screen And Height Equal To 40% Height Screen
        passwordResetView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height:                                                                                                                                          self.view.bounds.height * 0.4)
        
        passwordResetView.layer.cornerRadius = 7
        
    }

    //MARK: - Action Methods
    @IBAction func signInButton(_ sender: Any) {
        //Add Reactive Code For Off Continue Button Until Email And Password Field Fill
        //Add Code For Check Validate Inputs
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            showHud(text: "Signing in...")

            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
                if error != nil {
                    
                    self.dismissHud()
                
                    self.showAlert(title: "Error", message: "Invalid Email Or Password")
                    
                    self.alertAction(completion:  {
                        self.passwordTextField.text = ""
                    })
                    
                
            }else{
                
                    self.dismissHud()
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                
                }
            
            }//End SignIn Method
        
        }//End If Check For Empty Field Or Not
        else{

            showAlert(title: "Error", message: "Please Fill Email And Password Field")
            alertAction(completion: nil)
            
        }
            
    }//End IBAction Method
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToSignUp", sender: self)
        
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
     
        animatedIn(desiredView: blurView)
        animatedIn(desiredView: passwordResetView)
        
    }
        
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - Implementation Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    //MARK: - Implementation Handle Tap Gesure
    @objc func handleTap () {
        
        view.endEditing(true)
        
    }
    
    //TODO: Implementation Validate Email Adrress
    /*
    func validateEMail (_ emailText : String) -> Bool {
            
            
            
        }
    */
    
    //MARK: - Implementation Animate Blur View
    
    @IBAction func sendPasswordTapped(_ sender: Any) {
               
               if emailPasswordReset.text != "" {
                showHud(text: "Sending...")
                
                   Auth.auth().sendPasswordReset(withEmail: emailPasswordReset.text!) { (error) in
                       
                       if error != nil {
                        
                        self.dismissHud()
                        self.showAlert(title: "Error", message: "Can't Send Reset Password,Check Input Email")
                          
                        self.alertAction(completion: nil)
                   
                       }else{
                            
                            self.dismissHud()
                            self.showAlert(title: "Success", message: "Send Password To Email,Please Check You'r Email")
                            self.alertAction(completion: nil)
                           
                            self.animateOut(desiredView: self.passwordResetView)
                            self.animateOut(desiredView: self.blurView)
                           
                       }//End Else If error
                   
                   }//End Send Password Reset Method
                   
               }else {
                  
                    self.showAlert(title: "Error", message: "Please Enter You'r Email Address")
                    self.alertAction(completion: nil)
                
        }//End Else
        
    }
    
    func animatedIn(desiredView : UIView) {
        
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        //Set The View's Scaling To 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        //Animate The Effect
        UIView.animate(withDuration: 0.3) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    
    }
    
    func animateOut(desiredView : UIView) {
        UIView.animate(withDuration: 0.3 , animations: {
            
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            
        },completion: { _ in
            desiredView.removeFromSuperview()
        })
        
    }
    
    @IBAction func closeView(_ sender: Any) {
        
        animateOut(desiredView: passwordResetView)
        animateOut(desiredView: blurView)
        
    }
    //End Implementation Animate View
    
    //MARK: - Implementation Show Alert And Action
    func showAlert(title : String? , message : String?) {
        
        alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
    }
    
    func alertAction(completion : (() -> Void)? = nil) {
        
        let alertInAction = UIAlertAction(title: "OK", style: .default)
        
        alert?.addAction(alertInAction)
        present(alert! , animated: true , completion: nil)
       
        if let completions = completion {
            
            completions()
            
        }
    }
    
    //MARK: - Implementation Show And Dismiss Progress HUD
    func showHud(text : String) {
        
        hud.textLabel.text = text
        hud.show(in: self.view, animated: true)
        
    }
    
    func dismissHud() {
        
        hud.dismiss(animated: true)
        
    }
    //End Implementation Progress HUD
    
}//End SignIn View Controller Class

