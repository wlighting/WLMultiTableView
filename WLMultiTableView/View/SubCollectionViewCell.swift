//
//  SubCollectionViewCell.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/24.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.purple
    }

}
