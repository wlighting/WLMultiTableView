//
//  SYHttpTool.swift
//  beiiiSwift
//
//  Created by wlighting on 2017/5/30.
//  Copyright © 2017年 wlighting. All rights reserved.
//

import UIKit

import Alamofire

enum RequstType: Int {
    case GET
    case POST
    case PUT
    case DELETE
}

class SYHttpTool: NSObject {
    static let shareInstance:SYHttpTool = {
        return SYHttpTool()
    }()
}

extension SYHttpTool {


    func requestData(methodType:RequstType,urlString:String,parameters:[String:Any]?,finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) -> () {
        
        // 1.定义请求结果回调闭包
        let resultCallBack = { (response: DataResponse<Any>) in
            if response.result.isSuccess {
                finished(response.result.value as AnyObject?, nil)
            } else {
                finished(nil, response.result.error as NSError?)
            }
        }
        // 2.请求数据
        let httpMethod: HTTPMethod = {

            switch methodType {
            case RequstType.GET:
                return .get
            case RequstType.POST:
                return .post
            case RequstType.PUT:
                return .put
            case RequstType.DELETE:
                return .delete
            }
            
        
        
        }()
        request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: resultCallBack)
        
    }





}











