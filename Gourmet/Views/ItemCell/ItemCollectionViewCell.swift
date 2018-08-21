//
//  ItemCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    let backgroundImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "Salad Special"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.anchorFill(view: self.contentView)
        let points = [GradientPoint(location: 1, color: #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 0.6)), GradientPoint(location: 0.5, color: .clear),  GradientPoint(location: 1, color: .clear)]
        backgroundImageView.addMask(image: UIImage(size: frame.size, gradientPoints: points))
        
        contentView.addSubview(headerLabel)
        headerLabel.anchorMiddle(horizontal: contentView, vertical: contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
