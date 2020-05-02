//
//  CustomTableViewCell.swift
//  Hey-Guys
//
//  Created by Arash on 12/8/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var senderName: UILabel!
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
