//
//  AllCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class AllTableViewCell: UICollectionViewCell {
    let itemImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "Texas Steak House"
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .gray
        label.text = "Texas Steak House Texas Steak House Texas Steak House Texas Steak House Texas Steak House Texas Steak House Texas Steak House Texas Steak House"
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gourmetPurple
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
        cv.textColor = .black
        cv.settings.textFont = UIFont.boldSystemFont(ofSize: 10)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(itemImageView)
        let ratio = min(designHeightRatio,1)
        itemImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 12.5 * ratio, paddingLeft: 5, paddingBottom: 12.5 * ratio, paddingRight: 0, width: 0, height: 0)
        itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor).isActive = true
        
        let leftStack = UIStackView(arrangedSubviews: [headerLabel, descriptionLabel])
        leftStack.axis = .vertical
        leftStack.distribution = .fillProportionally
        leftStack.alignment = .leading
        leftStack.spacing = 8 * ratio
        
        let rightStack = UIStackView(arrangedSubviews: [priceLabel, ratingStarView])
        rightStack.axis = .vertical
        rightStack.distribution = .fillProportionally
        rightStack.alignment = .trailing
        
        let featuresStack = UIStackView(arrangedSubviews: [leftStack, rightStack])
        rightStack.axis = .horizontal
        rightStack.distribution = .fillProportionally
        rightStack.alignment = .fill
        contentView.addSubview(featuresStack)
        featuresStack.anchorMiddle(horizontal: nil, vertical: contentView)
        featuresStack.anchor(top: nil, left: itemImageView.rightAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 8*ratio, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)

        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
