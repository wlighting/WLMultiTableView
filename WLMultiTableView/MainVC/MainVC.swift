//
//  MainVC.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/6/27.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

import SDCycleScrollView

import SwiftyJSON

import HandyJSON

class MainVC: UIViewController {

    @IBOutlet weak var adView: UIView!
    
    @IBOutlet weak var titleButtonView: UIView!
    
    @IBOutlet weak var bottomContentScrollView: UIScrollView!
    
    @IBOutlet weak var allConttentScrollView: UIScrollView!

    @IBOutlet weak var subTableView: SubTableView!
    
    @IBOutlet weak var subCollectionView: SubCollectionView!
    
    @IBOutlet weak var subScrollView: SubScrollView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var urlPics: [String] = [String]()
    
    let navigationView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: WLWitdh, height: 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple
        self.automaticallyAdjustsScrollViewInsets = false
        navigationView.backgroundColor = UIColor.white
        view.addSubview(navigationView)
        
        setUpInitail()
        
        requstAdData();
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    class func getMainVC() -> MainVC {
        
        let MainVCStoryboard = UIStoryboard(name:"MainVC", bundle: nil)
        
        return MainVCStoryboard.instantiateViewController(withIdentifier:"MainVCID") as! MainVC
        
    }

    func setUpInitail() -> () {
        self.allConttentScrollView.delegate = self
        self.bottomContentScrollView.delegate = self
        self.subTableView.subInfoTableView.delegate = self;
        self.subCollectionView.subCollectionView.delegate = self;
        self.subScrollView.subScrollView.delegate = self;
    }
    
    @IBAction func titleChanged(_ sender: UIButton) {
        
        for button in self.buttons {
            button.isSelected = false
        }
        sender.isSelected = true
        
        let offset = CGPoint(x:WLWitdh * CGFloat(sender.tag - 10), y: 0.0)
        
        self.bottomContentScrollView.setContentOffset(offset, animated: true)
        
    }
    
    

}

extension MainVC : UIScrollViewDelegate,UITableViewDelegate,UICollectionViewDelegate{
// TODO:监听滚动
// FIXME:监听滚动
// !!!:监听滚动
// MARK:监听滚动
// MARK:- 监听滚动
    
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == allConttentScrollView {
//            WLLog("主ConttentScrollView滚动")
        }
        
//        WLLog(scrollView)
        let isContent = (scrollView == subTableView.subInfoTableView)||(scrollView == subCollectionView.subCollectionView)||(scrollView == subScrollView.subScrollView)
//  如果是三个子scrollView
        if isContent {
            let isScroll = allConttentScrollView.contentOffset.y < titleButtonView.frame.origin.y
            let offsetY = scrollView.contentOffset.y + allConttentScrollView.contentOffset.y
            if isScroll {
                allConttentScrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: false)
               
                scrollView.setContentOffset(CGPoint.zero, animated: false)
                
            }else if (scrollView.contentOffset.y <= 0 && !isScroll) {
                if allConttentScrollView.contentOffset.y >= titleButtonView.frame.origin.y {
                    allConttentScrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: false)
                }
            
            }
            
            
//  如果是主scrollView
        }else if scrollView == allConttentScrollView {
        
            if allConttentScrollView.contentOffset.y > titleButtonView.frame.origin.y {
                allConttentScrollView.setContentOffset(CGPoint(x: 0, y: titleButtonView.frame.origin.y), animated: false)
            }
        
        
        }

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        WLLog("scrollViewDidEndDragging")
        
        let isContent = (scrollView == subTableView.subInfoTableView)||(scrollView == subCollectionView.subCollectionView)||(scrollView == subScrollView.subScrollView)
        //  如果是三个子scrollView
        //处理因子视图向下拖拽而导致父视图无法回到原位置
        if isContent {

            let offsetY = allConttentScrollView.contentOffset.y;

            WLLog(offsetY)
            
            if offsetY < 0  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    // your code here
                    self.allConttentScrollView.setContentOffset(CGPoint.zero, animated: true)
                    WLLog("主ConttentScrollView 回到原位置")
                }
                
                
            }
        
        
        }
        
        
    }
    

        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == bottomContentScrollView {
            let tag = Int(scrollView.contentOffset.x/WLWitdh) + 10
            
            for button in buttons {
                
                button.isSelected = (button.tag == tag)
                
            }
        }
        
        
        
    }
    

}

extension  MainVC {

    
    func setUpAdView(addArray : [AdModel]) {
        guard let cycleView = SDCycleScrollView(frame: adView.bounds, delegate: self, placeholderImage: nil) else { return }

        cycleView.pageControlStyle = SDCycleScrollViewPageContolStyleNone
        cycleView.imageURLStringsGroup = urlPics
        adView.addSubview(cycleView)
    }

}


extension MainVC: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        WLLog("你选中了第\(index)张")
    }
}


extension MainVC {

    func requstAdData() {
//        http://112.124.47.54:31370
        SYHttpTool.shareInstance.requestData(methodType: .GET, urlString: "http://112.124.47.54:31370/product/top", parameters: ["typeName":"home"]) { (result, error) in
            
            if error != nil {
                WLLog(error)
            } else {
                let json = JSON(result)
                
                if let adModels = [AdModel].deserialize(from: json["content"].description , designatedPath: "data") {
                    adModels.forEach({ (adModel) in
                         WLLog(adModel?.url)
                    })
                }
              
//                if let adModels = JSONDeserializer<AdModel>.deserializeModelArrayFrom(json: json["content"].description ) {
//                    adModels.forEach({ (adModel) in
//                        WLLog(adModel)
//                    })
//
//                
//                }
                
                
                
            }
            
        }
        

    }

  
}











