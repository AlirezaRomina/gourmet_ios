//
//  ImageCache.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ImageCache{

    static var imageCache = [String: UIImage]()
    
    class func check(url: String, completion: ((_ image: UIImage?) -> Void)? = nil){
        completion?(imageCache[url])
    }
    
    class func addCache(url: String, image: UIImage?, completion: ((_ image: UIImage)  -> Void)? = nil)  {
        guard let image = image else {return}
        imageCache[url] = image
        completion?(image)
    }
}
