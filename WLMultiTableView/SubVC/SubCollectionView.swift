//
//  SubCollectionView.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/22.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubCollectionView: UIView {

    let subCollectionCellID:String = "subCollectionCellID"
    
    private var contentView: UIView!
    
    @IBOutlet weak var subCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        WLLog(subCollectionView)
        
        self.subCollectionView.register(UINib(nibName: "SubCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: subCollectionCellID)
        self.subCollectionView.delegate = self
        self.subCollectionView.dataSource = self
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        contentView = Bundle.main.loadNibNamed("SubCollectionView", owner: self, options: nil)?.first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
    }
    

}

extension SubCollectionView: UICollectionViewDelegate,UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return 80;
    
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCollectionCellID, for: indexPath) as? SubCollectionViewCell
        cell?.infoLable.text = ("第\(indexPath.item)个")
        return cell!;
    
    
    }



}
