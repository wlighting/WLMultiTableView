//
//  MainVC.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/6/27.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class func getMainVC() -> MainVC {
        
        let MainVCStoryboard = UIStoryboard(name:"MainVC", bundle: nil)
        
        return MainVCStoryboard.instantiateViewController(withIdentifier:"MainVCID") as! MainVC
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
