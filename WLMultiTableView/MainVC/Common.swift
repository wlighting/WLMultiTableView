//
//  Common.swift
//  WLMultiTableView
//
//  Created by wlighting on 2017/7/22.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

// 当前系统版本
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue
// 屏幕宽度
let WLWitdh = UIScreen.main.bounds.height
// 屏幕高度
let WLHeight = UIScreen.main.bounds.width

// MARK:- 颜色方法
func WLRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


// MARK:- 自定义打印方法
func WLLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
        
    #endif
}
