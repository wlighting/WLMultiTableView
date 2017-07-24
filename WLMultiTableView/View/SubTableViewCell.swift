//
//  SubTableViewCell.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/22.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
