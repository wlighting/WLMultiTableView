//
//  SubTableView.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/22.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class SubTableView: UIView {

    let subInfoTableViewID:String = "subInfoTableViewID"
    
    private var contentView: UIView!
    
    
    @IBOutlet weak var subInfoTableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
       
        WLLog(subInfoTableView)
        self.subInfoTableView.register(UINib(nibName: "SubTableViewCell", bundle: nil), forCellReuseIdentifier: subInfoTableViewID)
        self.subInfoTableView.delegate = self
        self.subInfoTableView.dataSource = self
    }
    
    
    // 从storyboard上初始化时，会调用该方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        contentView = Bundle.main.loadNibNamed("SubTableView", owner: self, options: nil)?.first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
       
    }
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadFromNib()
        addSubview(contentView)
        
        self.subInfoTableView.register(UINib(nibName: "SubTableViewCell", bundle: nil), forCellReuseIdentifier: subInfoTableViewID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView = loadFromNib()
        addSubview(contentView)
        self.subInfoTableView.register(UINib(nibName: "SubTableViewCell", bundle: nil), forCellReuseIdentifier: subInfoTableViewID)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.frame = bounds
    }
    
    func loadFromNib() -> UIView {
        return Bundle.main.loadNibNamed("SubTableView", owner: nil, options: nil)?.first as! UIView
    }*/
    
    
}


extension SubTableView :UITableViewDelegate,UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: subInfoTableViewID)as?SubTableViewCell
        cell?.infoLable.text = "第\(indexPath.row)行"
        
        return cell!
    
    }



}
