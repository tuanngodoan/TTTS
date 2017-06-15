//
//  InfoUserTableViewCell.swift
//  TTTS
//
//  Created by Doan Tuan on 5/18/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class InfoUserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var soBaoDanhLabel:UILabel!
    @IBOutlet weak var chungMinhNDLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // customImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customImage(){
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }

}
