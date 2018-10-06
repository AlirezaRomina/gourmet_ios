//
//  Router.swift
//  TestProject
//
//  Created by Deniz Mersinlioğlu on 29.09.2018.
//  Copyright © 2018 mersinliogludeniz. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

typealias Route = (method: HTTPMethod, path: String, parameters: Parameters?, encoding: ParameterEncoding)

enum Router {
    case getRestaurant
    case getItem

    private func generateRoute(queryParameter: String = "", parameters: Parameters? = nil) -> Route {
        switch self {
        case .getRestaurant: return (.post, "/client/getsession", parameters, JSONEncoding.default)
        case .getItem: return(.post, "/location/getflightlocations", parameters, JSONEncoding.default)
        }
    }
    
    func promise<T: Serializable>(queryParameter: String = "", parameters: Codable? = nil) -> Promise<T> {
        return Promise<T> { seal in
            var headers =  [String: String]()
            headers[HTTPHeaderField.contentType.rawValue] = ContentType.json.rawValue
            headers[HTTPHeaderField.authentication.rawValue] = NetworkConstants.DevelopmentServer.authToken
            //TODO: Check this casting
            let parameter = parameters as? Serializable
            let route = generateRoute(queryParameter: queryParameter, parameters: parameter?.toDict())
            let url = "\(NetworkConstants.DevelopmentServer.baseURL)\(route.path)"
            WebServiceLogger.logRequestInfo(url: url, route: route, headers: headers)
            Alamofire.request(url, method: route.method, parameters: route.parameters, encoding: route.encoding, headers: headers)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        response.logResponse()
                        do{
                            guard let data = response.data else {throw AFError.responseValidationFailed(reason: .dataFileNil)}
                            let info = try JSONDecoder().decode(T.self, from: data)
                            seal.fulfill(info)
                        }
                        catch{
                            seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                    case .failure(let error):
                        response.logError()
                        seal.reject(error)
                    }
                }
            }
    }
}
