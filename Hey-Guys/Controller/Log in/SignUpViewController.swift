//
//  SignUpViewController.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {

    //MARK: Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    //MARK: - Variable
    var alert : UIAlertController? = nil
    let hud = JGProgressHUD(style: .light)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Actions
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func imagePickerButton(_ sender: Any) {
        
        showAlert(style: .actionSheet, title: "Choose Picture", message: nil)
        alertAction ()
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
     
        if nameField.text != "" && emailTextField.text != "" && passwordTextField.text != "" && confirmPasswordField.text != "" {
                
            if passwordTextField.text!.count >= 6 {
                
                if passwordTextField.text == confirmPasswordField.text {
                
                            showHud(text: "Signing up...")
                            Auth.auth().createUser(withEmail: emailTextField.text! , password: passwordTextField.text!){ (user , error) in
                
                                    if error != nil {
                    
                                        self.dismissHud()
                                        self.showAlert(style: .alert, title: "Invalid Email", message: "Please Check Email Address")
                                        
                                        self.alertAction(){
                                            
                                        self.passwordTextField.text = ""
                                        self.confirmPasswordField.text = ""
                                            
                                        }
                                        
                                    }else{
                                        
                                        self.dismissHud()
                                        self.performSegue(withIdentifier: "goToChat", sender: self)
                    
                                }

                            }
 
                }else {
            
                        confirmPasswordField.text = ""
                        confirmPasswordField.placeholder = "Password Must Match,Try Again"
            
                        }
            }else{
                
                    showAlert(style: .alert, title: "Password Must 6 Charcters or More", message: "")
                    alertAction(){
                
                        self.passwordTextField.text = ""
                        self.confirmPasswordField.text = ""
                }
                
            }
                        
        }else{
            
                showAlert(style: .alert, title: "Error", message: "Please Fill All Fields")
                alertAction()
            
        }
            
         }//End Sign up Method

    @objc func handleTap() {
        
        view.endEditing(true)
        
    }
    
    //MARK: - Implementation Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    //MARK: - Implementation Show Alert And Action
    func showAlert(style :  UIAlertController.Style , title : String? , message : String?) {
           
           alert = UIAlertController(title: title, message: message , preferredStyle: style)
           
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
           
       }//End Implementation Progress HUD
       
}//End Sign up Controller Class
