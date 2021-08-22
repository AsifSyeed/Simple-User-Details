//
//  UserInputTableViewCell.swift
//  userDetails
//
//  Created by BS-236 on 19/8/21.
//

import UIKit

class UserInputTableViewCell: UITableViewCell {

    
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
