//
//  RateViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class RateViewController: UIViewController, UITextViewDelegate {

    var commetTextViewDefaultTopAnchor: NSLayoutConstraint!
    var commetTextViewKeyboardTopAnchor: NSLayoutConstraint!
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        label.textColor = .black
        label.text = "Item Name"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let ratingStarView: CosmosView = {
        let cv = CosmosView()
        cv.settings.filledImage = #imageLiteral(resourceName: "icon_star_big")
        cv.settings.emptyImage = #imageLiteral(resourceName: "icon_star_big_empty")
        cv.settings.updateOnTouch = true
        cv.settings.fillMode = .full
        cv.settings.starSize = 45 * Double(designWidthRatio)
        cv.settings.starMargin = 2
        cv.rating = 3.7
        cv.text = "   \(cv.rating) / 5.0"
        cv.totalStars = 5
        cv.textColor = UIColor(white: 0, alpha: 0.6)
        cv.didTouchCosmos = {rating in
            cv.text = "    \(rating)/5.0"}
        cv.settings.textFont = UIFont.systemFont(ofSize: 24, weight: .medium)
        return cv
    }()
    
    lazy var commetTextView: UITextView = {
        let tv = UITextView()
        tv.layer.borderColor = UIColor(white: 0, alpha: 0.4).cgColor
        tv.layer.borderWidth = 1
        tv.layer.cornerRadius = 8
        tv.textColor = .lightGray
        tv.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        tv.text = "Write your commets here..."
        tv.delegate = self
        tv.tintColor = .black
        tv.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return tv
    }()
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.layer.borderColor = UIColor(white: 0, alpha: 1).cgColor
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderColor = UIColor(white: 0, alpha: 0.4).cgColor
            textView.text = "Write your commets here..."
            textView.textColor = .lightGray
        }
    }
    
    let rateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = (36*designHeightRatio) / 2
        button.setTitle("RATE", for: .normal)
        button.backgroundColor = .gourmetPurple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardOnTap()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(ratingStarView)
        ratingStarView.anchor(top: headerLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 8 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(rateButton)
        rateButton.anchorMiddle(horizontal: self.view, vertical: nil)
        rateButton.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20*designHeightRatio, paddingRight: 0, width: 150*designHeightRatio, height: 36 * designHeightRatio)
        
        view.addSubview(commetTextView)
        commetTextViewKeyboardTopAnchor = commetTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5*designHeightRatio)
        commetTextViewKeyboardTopAnchor.isActive = false
        commetTextViewDefaultTopAnchor = commetTextView.topAnchor.constraint(equalTo: ratingStarView.bottomAnchor, constant: 15*designHeightRatio)
        commetTextViewDefaultTopAnchor.isActive = true
        commetTextView.anchor(top: nil, left: view.leftAnchor, bottom: rateButton.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 15*designHeightRatio, paddingRight: 15, width: 0, height: 0)
        view.updateConstraints()

    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        commetTextViewDefaultTopAnchor.isActive = false
        commetTextViewKeyboardTopAnchor.isActive = true
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        commetTextViewKeyboardTopAnchor.isActive = false
        commetTextViewDefaultTopAnchor.isActive = true

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}
