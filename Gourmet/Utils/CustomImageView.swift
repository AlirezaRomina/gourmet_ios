//
//  CustomImageView.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit
import Swinject

class CustomImageView: UIImageView {
    
    let imageLoader = ImageLoader()
    convenience init(){
        self.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(urlString: String){
        imageLoader.loadImage(from: urlString) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
