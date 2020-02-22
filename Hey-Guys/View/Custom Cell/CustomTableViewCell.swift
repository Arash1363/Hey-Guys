//
//  CustomTableViewCell.swift
//  Hey-Guys
//
//  Created by Arash on 12/3/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var senderUserName: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
