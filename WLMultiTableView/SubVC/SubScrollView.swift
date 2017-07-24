//
//  SubScrollView.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/22.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubScrollView: UIView {
    
    @IBOutlet weak var subScrollView: UIScrollView!
    
    private var contentView: UIView!
    // 从storyboard上初始化时，会调用该方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        contentView = Bundle.main.loadNibNamed("SubScrollView", owner: self, options: nil)?.first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
    }
    


}
