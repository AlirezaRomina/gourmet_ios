//
//  Extension.swift
//  TestProject
//
//  Created by Deniz Mersinlioğlu on 30.09.2018.
//  Copyright © 2018 mersinliogludeniz. All rights reserved.
//

import Foundation
import Alamofire

extension DataResponse {
    func logError(){
        let bodyString = data != nil ? String(data: data!, encoding: .utf8) : "Could not convert to string."
        print("--------Response----------")
        print("URL         : \(String(describing: request?.url))")
        print("Status Code : \(response?.statusCode ?? 500)")
        print("Error        : \(String(describing: result.error))")
        print("Data        : \(String(describing: bodyString))")
        print("------------------------")
    }
    
    func logResponse(){
        let urlString = response?.url != nil ? String(describing: response?.url!) : "Could not convert to string."
        let bodyString = data != nil ? String(data: data!, encoding: .utf8) : "Could not convert to string."
        print("--------Response----------")
        print("URL         : \(urlString)")
        print("Status Code : \(response?.statusCode ?? 0)")
        print("Body        : \(String(describing: bodyString))")
        print("------------------------")
    }
}
