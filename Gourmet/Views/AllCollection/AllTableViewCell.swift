//
//  AllCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class AllTableViewCell: UITableViewCell {
    let itemImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.text = "Item Name"
        label.numberOfLines = 2
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
    
    let rightArrowImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "arrow_right")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemImageView)
        itemImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 8 * designHeightRatio, paddingLeft: 15, paddingBottom: 8 * designHeightRatio, paddingRight: 0, width: 0, height: 0)
        itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor).isActive = true
        
        contentView.addSubview(rightArrowImage)
        rightArrowImage.anchorMiddle(horizontal: nil, vertical: contentView)
        rightArrowImage.anchor(top: nil, left: nil, bottom: nil, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 25 * designHeightRatio, width: 9*designHeightRatio, height: 16*designHeightRatio)
        
        let stackView = UIStackView(arrangedSubviews: [headerLabel, ratingStarView, priceLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 3 * designHeightRatio
        contentView.addSubview(stackView)
        stackView.anchorMiddle(horizontal: nil, vertical: contentView)
        stackView.anchor(top: nil, left: itemImageView.rightAnchor, bottom: nil, right: rightArrowImage.leftAnchor, paddingTop: 0, paddingLeft: 10 * designHeightRatio, paddingBottom: 0, paddingRight: 25 * designHeightRatio, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
