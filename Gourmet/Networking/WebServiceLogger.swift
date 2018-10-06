//
//  RequestLogger.swift
//  TestProject
//
//  Created by Deniz Mersinlioğlu on 30.09.2018.
//  Copyright © 2018 mersinliogludeniz. All rights reserved.
//

import Foundation

class WebServiceLogger{
    class func logRequestInfo(url: String, route: Route, headers: [String: String] ){
        print("--------Request----------")
        print("URL         : \(url)")
        print("Method      : \(route.method.rawValue)")
        print("Headers     : \(headers as AnyObject)")
        print("Parameters  : \(String(describing: route.parameters))")
        print("------------------------")
    }
    
   
}

