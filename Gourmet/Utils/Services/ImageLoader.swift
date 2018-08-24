//
//  ImageLoader.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 24.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ImageLoader{
    var lastURLUsedToLoadImage: String?
    let networking = HTTPNetworking()
    
    func loadImage(from urlString: String, completion: @escaping (_ image: UIImage) -> Void){
        guard let url = URL(string: urlString) else {return}
        self.lastURLUsedToLoadImage = urlString
        ImageCache.check(url: urlString) { (image) in
            if let image = image {
                completion(image)
                return
            }
        }
        networking.request(from: url) { (data, err) in
            if let err = err{
                print("Failed to fetch profile image", err)
                return
            }
            guard url.absoluteString == self.lastURLUsedToLoadImage,
                let data = data  else {return}
            guard let image = UIImage(data: data) else {return}
            ImageCache.addCache(url: url.absoluteString, image: image)
            completion(image)
        }
        
    }
}
