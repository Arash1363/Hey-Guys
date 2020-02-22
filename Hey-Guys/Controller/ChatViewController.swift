//
//  ChatViewController.swift
//  Hey-Guys
//
//  Created by Arash on 12/1/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {

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
        
        //Register Custom Cell Table View .xib
        messageTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        
        //Set up TapGesture For End Editing
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        configureTableView()
        
    }
    
    //MARK: - Implementation Table View Data Source Protocol Methods
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
                   
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! CustomTableViewCell
        let messageArray = ["One" , "Two" , "Threeaaaaaaaaaaaaaaaahsnshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshhshsh"]
        
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
       
    }//End Table View Data Source Methods
    
    //MARK: - Configure Table View
    func configureTableView() {
        
        messageTableView.rowHeight = UITableView.automaticDimension
        //messageTableView.estimatedRowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
    }
    
    
    @IBAction func sendMessageButton(_ sender: Any) {
    
    
    
    }
    
    //MARK: - Implementation Text Field Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
        
            self.heightConstraint.constant = 268
            self.view.layoutIfNeeded()
        
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            
            self.heightConstraint.constant = 62
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        chatTextField.resignFirstResponder()
        return true
        
    }
    
    //MARK: - Implementation Method Table View Tapped
    @objc func tableViewTapped() {
        
        chatTextField.endEditing(true)
        
    }
    
    
}
