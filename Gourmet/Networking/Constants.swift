//
//  Constants.swift
//  TestProject
//
//  Created by Deniz Mersinlioğlu on 29.09.2018.
//  Copyright © 2018 mersinliogludeniz. All rights reserved.
//

import Foundation

import Foundation

struct NetworkConstants {
    struct DevelopmentServer {
        static let baseURL = "https://v2-api.obilet.com/api"
        static let authToken = "Basic MTIzNDU2MTIzNDU2MTIzNDU2MTIzNDU2"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
