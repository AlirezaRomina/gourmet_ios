//
//  RateViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemRateController: UIViewController, UITextViewDelegate {

    @IBOutlet var commentTextViewDefaultBottomAnchor: NSLayoutConstraint!
    @IBOutlet var commentTextViewDefaultTopAnchor: NSLayoutConstraint!
    @IBOutlet var ratingStarView: CosmosView!
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var headerLabel: UILabel!
    
    var commentTextViewKeyboardTopAnchor: NSLayoutConstraint!
    var commentTextViewKeyboardBottomAnchor: NSLayoutConstraint!
    
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
            textView.text = "Write your comments here..."
            textView.textColor = .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardOnTap()
        ratingStarView.starSize = Double(45 * designWidthRatio)
        ratingStarView.didTouchCosmos = {rating in
            self.ratingStarView.text = "    \(rating)/5.0"}
        ratingStarView.settings.textFont = UIFont.systemFont(ofSize: 24, weight: .medium)
        commentTextView.layer.borderColor = UIColor(white: 0, alpha: 0.4).cgColor
        commentTextView.layer.borderWidth = 1
        commentTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        commentTextViewKeyboardTopAnchor = commentTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2)
        commentTextViewKeyboardBottomAnchor = commentTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        commentTextViewDefaultTopAnchor.isActive = false
        commentTextViewKeyboardTopAnchor.isActive = true
        commentTextViewDefaultBottomAnchor.isActive = false
        commentTextViewKeyboardBottomAnchor.isActive = true
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            commentTextViewKeyboardBottomAnchor.constant = -keyboardHeight + 48
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        commentTextViewKeyboardTopAnchor.isActive = false
        commentTextViewDefaultTopAnchor.isActive = true
        commentTextViewKeyboardBottomAnchor.isActive = false
        commentTextViewDefaultBottomAnchor.isActive = true
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}
