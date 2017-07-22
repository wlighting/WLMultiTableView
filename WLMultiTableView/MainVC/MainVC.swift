//
//  MainVC.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/6/27.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var adView: UIView!
    
    @IBOutlet weak var titleButtonView: UIView!
    
    let navigationView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: WLWitdh, height: 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple
        self.automaticallyAdjustsScrollViewInsets = false
        navigationView.backgroundColor = UIColor.white
        view.addSubview(navigationView)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    class func getMainVC() -> MainVC {
        
        let MainVCStoryboard = UIStoryboard(name:"MainVC", bundle: nil)
        
        return MainVCStoryboard.instantiateViewController(withIdentifier:"MainVCID") as! MainVC
        
    }

 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
