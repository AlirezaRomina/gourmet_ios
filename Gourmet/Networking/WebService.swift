//
//  WebSerview.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation
import PromiseKit

class WebService{
    
    func getRestaurant(restaurantId: Int64) -> Promise<Restaurant>{
        let locationPromise: Promise<Restaurant> = Router.getRestaurant.promise(parameters: restaurantId)
        return locationPromise.then { resturanResponseModel  -> Promise<Restaurant> in
            return Promise.value(resturanResponseModel)
        }
    }
}
