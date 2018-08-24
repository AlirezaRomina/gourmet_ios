//
//  Networking.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

protocol Networking {
    typealias CompletionHandler = (Data?, Swift.Error?) -> Void
    func request(from: URL, completion: @escaping CompletionHandler)
}

struct HTTPNetworking: Networking {
    func request(from: URL, completion: @escaping CompletionHandler) {
        let request = createRequest(from: from)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringCacheData
        return request
    }
    
    private func createDataTask(from request: URLRequest,
                                completion: @escaping CompletionHandler) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, httpResponse, error in
            completion(data, error)
        }
    }
}
