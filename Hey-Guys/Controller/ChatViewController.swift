//
//  ChatViewController.swift
//  Hey-Guys
//
//  Created by Arash on 12/1/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {

    //Properties
    var messageArray : [Message] = [Message]()
    
    //MARK: - Outlets
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        chatTextField.delegate = self

        //Set up TapGesture For End Editing
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        //Register Custome Cell .xib
        messageTableView.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //Configuration Table Cell Row Height In Method
        configureTableView()
        
        messageTableView.separatorStyle = .none
        
        //Show Message From Firebase Database
        receiveMessages()
        
    }
    
    
     //MARK: - Implementation Method Table View Tapped
       @objc func tableViewTapped() {
           
           chatTextField.endEditing(true)
           
       }
    
     //MARK: - Configure Table View
       func configureTableView() {
           
           messageTableView.rowHeight = UITableView.automaticDimension
           messageTableView.estimatedRowHeight = 120.0
           
       }
    
     //MARK: - Implementation Text Field Delegate Methods
       func textFieldDidBeginEditing(_ textField: UITextField) {
           
           UIView.animate(withDuration: 0.3) {
           
               self.heightConstraint.constant = 265
               self.view.layoutIfNeeded()
           
           }
           
       }
       
       func textFieldDidEndEditing(_ textField: UITextField) {
           
           UIView.animate(withDuration: 0.3) {
               
               self.heightConstraint.constant = 60
               self.view.layoutIfNeeded()
               
           }
           
       }
       
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
           textField.resignFirstResponder()
           return true
           
       }//End Text Field Delegate Implementation Method
    
    
    //MARK: - Implementation Table View Data Source Protocol Methods
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return messageArray.count
                   
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderName.text = messageArray[indexPath.row].sender
        cell.userImage.image = UIImage(named: "IMG")
        
        if cell.senderName.text == Auth.auth().currentUser?.email as String? {
            
            cell.messageBackground.backgroundColor = UIColor.blue
            
        }else{
            
            cell.messageBackground.backgroundColor = UIColor.green
        
        }
        
        return cell
       
    }//End Table View Data Source Methods
    
    
    //MARK: - Send And Recieve From Firebase Database
    @IBAction func sendMessageButton(_ sender: Any) {
    
        chatTextField.endEditing(true)
        
        chatTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let messageDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender" : Auth.auth().currentUser?.email , "MessageBody" : chatTextField.text!]
        
        messageDB.childByAutoId().setValue(messageDictionary){
        (error , refrence) in
            
            if error != nil {
                print(error!)
            }else{
               
                self.chatTextField.text = ""
                self.chatTextField.isEnabled = true
                self.sendButton.isEnabled = true
                
            }
            
        }
    
    }
    
    func receiveMessages() {
        
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded , with: { (snapShot) in
            let snapShotValue = snapShot.value as! Dictionary<String,String>
            let text = snapShotValue["MessageBody"]!
            let sender = snapShotValue["Sender"]!
            
            let message = Message()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)

            self.configureTableView()
            self.messageTableView.reloadData()
            
        })
        
    }

    
}//End Class
