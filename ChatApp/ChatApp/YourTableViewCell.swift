//
//  YourTableViewCell.swift
//  ChatApp
//
//  Created by KKANG on 2021/08/27.
//

import UIKit

class YourTableViewCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
