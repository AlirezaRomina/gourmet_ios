//
//  CategoryCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var category: Category?{
        didSet{
            guard let category = category else {return}
            headerLabel.text = category.name
            descriptionLabel.text = category.description
            backgroundImageView.loadImage(urlString: category.imageUrl)
        }
    }
    
    let backgroundImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        let maskColor = UIColor(white: 0, alpha: 0.3)
        iv.addMask(image: UIImage.from(color: maskColor))
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.text = "Category Name"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 3
        label.text = "Category short description \nMaximum 2 lines"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.anchorFill(view: self.contentView)
        
        let labelStack = UIStackView(arrangedSubviews: [headerLabel,descriptionLabel])
        labelStack.alignment = .fill
        labelStack.axis = .vertical
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 3
        
        contentView.addSubview(labelStack)
        labelStack.anchor(top: nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 12 * min(designHeightRatio,1), paddingRight: 0, width: 0, height: 0)
        labelStack.anchorProportion(view: contentView, widthRatio: 0.8, heightRatio: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
