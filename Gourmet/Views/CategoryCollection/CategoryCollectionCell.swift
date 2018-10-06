//
//  CategoryCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    @IBOutlet var background: UIImageView!
    @IBOutlet var header: UILabel!
    @IBOutlet var desc: UILabel!
    
    var category: Category?{
        didSet{
            guard let category = category else {return}
            header.text = category.name
            desc.text = category.description
//            background.loadImage(urlString: category.imageUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.addMask(image: UIImage.from(color: UIColor(white: 0, alpha: 0.1)))
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
