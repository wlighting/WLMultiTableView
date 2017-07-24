//
//  SubCollectionFlowLayout.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/24.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubCollectionFlowLayout: UICollectionViewFlowLayout {

    
    
    
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        let width = (WLWitdh - 30) / 2;
        self.itemSize =  CGSize(width: width, height: width);
        
    }

}
