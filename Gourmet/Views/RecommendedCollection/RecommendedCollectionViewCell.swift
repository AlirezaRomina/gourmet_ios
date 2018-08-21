//
//  ItemCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    let backgroundImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "Texas Steak House with onion"
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "$20"
        return label
    }()
    
    let ratingStarView: CosmosView = {
        let cv = CosmosView()
        cv.settings.filledImage = #imageLiteral(resourceName: "star_filled")
        cv.settings.emptyImage = #imageLiteral(resourceName: "star_unfilled")
        cv.settings.updateOnTouch = false
        cv.settings.fillMode = .precise
        cv.settings.starSize = 10
        cv.settings.starMargin = 2
        cv.rating = 3.5
        cv.text = "(52)"
        cv.totalStars = 5
        cv.textColor = .white
        cv.settings.textFont = UIFont.boldSystemFont(ofSize: 10)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.anchorFill(view: self.contentView)
        let points = [GradientPoint(location: 1, color: #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 0.8)), GradientPoint(location: 0.4, color: .clear),  GradientPoint(location: 0, color: .clear)]
        backgroundImageView.addMask(image: UIImage(size: frame.size, gradientPoints: points))
        
        contentView.addSubview(ratingStarView)
        ratingStarView.anchor(top: nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
        contentView.addSubview(headerLabel)
        headerLabel.anchor(top: nil, left: contentView.leftAnchor, bottom: ratingStarView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 4, paddingRight: 0, width: 0, height: 0)
        headerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width - 15).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.anchor(top: nil, left: nil, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 10, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
