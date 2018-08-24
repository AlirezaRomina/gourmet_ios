//
//  ItemCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
   
    var imageUrl: String?{
        didSet{
            backgroundImageView.loadImage(urlString: imageUrl ?? "")
        }
    }
    let backgroundImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.text = "Item Name"
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let ratingStarView: CosmosView = {
        let cv = CosmosView()
        cv.settings.filledImage = #imageLiteral(resourceName: "star_filled")
        cv.settings.emptyImage = #imageLiteral(resourceName: "star_unfilled")
        cv.settings.updateOnTouch = false
        cv.settings.fillMode = .precise
        cv.settings.starSize = 12
        cv.settings.starMargin = 2
        cv.rating = 3.5
        cv.text = "(52)"
        cv.totalStars = 5
        cv.textColor = .white
        cv.settings.textFont = UIFont.boldSystemFont(ofSize: 12)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.anchorFill(view: self.contentView)
        let gradientImage = UIImage.image(withRGBAGradientColors: [1: RGBA(color: .gourmetPurple), 0.6: RGBA(color: .clear)], size: contentView.bounds.size)
        backgroundImageView.addMask(image: gradientImage)
        
        contentView.addSubview(headerLabel)
        headerLabel.anchor(top: nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 6 * designWidthRatio, paddingBottom: 6 * designHeightRatio, paddingRight: 6 * designWidthRatio, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
