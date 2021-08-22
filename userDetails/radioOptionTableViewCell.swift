//
//  radioOptionTableViewCell.swift
//  userDetails
//
//  Created by BS-236 on 19/8/21.
//

import UIKit

class radioOptionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var radioButtonOutlet: UIButton!
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
