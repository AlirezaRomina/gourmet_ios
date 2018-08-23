//
//  ItemInfoViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        label.textColor = .black
        label.text = "Texas Steak House"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
 
    let ratingStarView: CosmosView = {
        let cv = CosmosView()
        cv.settings.filledImage = #imageLiteral(resourceName: "star_filled")
        cv.settings.emptyImage = #imageLiteral(resourceName: "star_unfilled")
        cv.settings.updateOnTouch = false
        cv.settings.fillMode = .precise
        cv.settings.starSize = 18
        cv.settings.starMargin = 2
        cv.rating = 3.5
        cv.text = "(522)"
        cv.totalStars = 5
        cv.textColor = UIColor(white: 0, alpha: 0.6)
        cv.settings.textFont = UIFont.boldSystemFont(ofSize: 14)
        return cv
    }()
    
    let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = (36*designHeightRatio) / 2
        button.setTitle("ORDER", for: .normal)
        button.backgroundColor = .gourmetPurple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headerLabel)
        headerLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
        view.addSubview(ratingStarView)
        ratingStarView.anchor(top: headerLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let ingredientsTitle = featureTitle(text: "Ingredients:")
        let ingredientsDetail = featureDetailText(text: "Lorem Ipsum is simply dummy text of the printing and lorem Ipsum is simply dummy Lorem Ipsum issimply dummy", font: UIFont.systemFont(ofSize: 12, weight: .regular), color: .black, numberOfLines: 4)
        let ingredientsStack = featureStackLabel(first: ingredientsTitle, second: ingredientsDetail, alignment: .top)
        placeFeatureStack(ingredientsStack, titleView: ingredientsTitle,under: ratingStarView, padding: 12*designHeightRatio)
        
        let caloriesTitle = featureTitle(text: "Calories:")
        let caloriesDetail = featureDetailText(text: "145 kcal", font: UIFont.boldSystemFont(ofSize: 14))
        let caloriesStack = featureStackLabel(first: caloriesTitle, second: caloriesDetail)
        placeFeatureStack(caloriesStack, titleView:caloriesTitle, under: ingredientsStack)
        
        let priceTitle = featureTitle(text: "Price:")
        let priceDetail = featureDetailText(text: "$20.59", font: UIFont.boldSystemFont(ofSize: 14))
        let priceStack = featureStackLabel(first: priceTitle, second: priceDetail)
        placeFeatureStack(priceStack,titleView: priceTitle, under: caloriesStack)
        
        let veganTitle = featureTitle(text: "Vegan:")
        let veganDetail = featureCheckImage(checked: false)
        let veganStack = featureStackImage(first: veganTitle, second: veganDetail)
        view.addSubview(veganStack)
        veganStack.anchor(top: priceStack.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 6*designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        veganTitle.anchorProportion(view: priceStack, widthRatio: 0.3, heightRatio: nil)
        
        view.addSubview(orderButton)
        orderButton.anchorMiddle(horizontal: self.view, vertical: nil)
        orderButton.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20*designHeightRatio, paddingRight: 0, width: 150*designHeightRatio, height: 36 * designHeightRatio)
    }
    
    fileprivate func featureStackLabel(first: UIView, second: UILabel, alignment: UIStackView.Alignment = .center ) -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [first, second])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = alignment
        return stackView
    }
    
    fileprivate func featureStackImage(first: UIView, second: UIImageView, alignment: UIStackView.Alignment = .center) -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [first, second])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.alignment = alignment
        return stackView
    }
    
    fileprivate func featureTitle(text: String) -> UILabel{
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(white: 0, alpha: 0.6)
        label.text = text
        label.numberOfLines = 1
        return label
    }
    
    fileprivate func featureDetailText(text: String, font: UIFont, color: UIColor = .black, numberOfLines: Int = 1 ) -> UILabel{
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.text = text
        label.numberOfLines = numberOfLines
        return label
    }
    
    fileprivate func featureCheckImage(checked: Bool) -> UIImageView{
        let iv = UIImageView()
        let image = checked ? #imageLiteral(resourceName: "ic_check").withRenderingMode(.alwaysTemplate) : #imageLiteral(resourceName: "ic_error").withRenderingMode(.alwaysTemplate)
        iv.tintColor = checked ? .green : .red
        iv.image = image
        iv.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        return iv
    }
    
    fileprivate func placeFeatureStack(_ stack: UIView, titleView: UIView, under: UIView, padding: CGFloat = 6){
        view.addSubview(stack)
        stack.anchor(top: under.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: padding, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        titleView.anchorProportion(view: stack, widthRatio: 0.3, heightRatio: nil)
    }
}
