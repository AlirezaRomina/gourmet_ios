//
//  UIView.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat{
        get{return layer.cornerRadius}
        set{layer.cornerRadius = newValue}
    }
    
    @IBInspectable
    var shadowRadius: CGFloat{
        get{return layer.shadowRadius}
        set{
            layer.masksToBounds = newValue == 0
            layer.shadowRadius = newValue}
    }
    
    @IBInspectable
    var shadowColor: UIColor{
        get{return UIColor(cgColor: layer.shadowColor ?? UIColor.clear.cgColor)}
        set{layer.shadowColor = newValue.cgColor}
    }
    
    @IBInspectable
    var shadowOffSet: CGSize{
        get{return layer.shadowOffset}
        set{layer.shadowOffset = newValue}
    }
    
    @IBInspectable
    var shadowOpacity: Float{
        get{return layer.shadowOpacity}
        set{layer.shadowOpacity = newValue}
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true}
        if let left = left{leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true}
        if let bottom = bottom{bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true}
        if let right = right{rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true}
        if width != 0 {widthAnchor.constraint(equalToConstant: width).isActive = true}
        if height != 0 {heightAnchor.constraint(equalToConstant: height).isActive = true}
    }
    
    func anchorFill(view: UIView){
        anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func anchorProportion(view: UIView, widthRatio: Double?, heightRatio: Double?){
        translatesAutoresizingMaskIntoConstraints = false
        if let widthRatio = widthRatio {
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(widthRatio)).isActive = true
        }
        if let heightRatio = heightRatio {
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: CGFloat(heightRatio)).isActive = true
        }
    }
    
    func anchorMiddle(horizontal: UIView?, vertical: UIView?){
        translatesAutoresizingMaskIntoConstraints = false
        if let horizontal = horizontal{
            centerXAnchor.constraint(equalTo: horizontal.centerXAnchor).isActive = true
        }
        if let vertical = vertical{
            centerYAnchor.constraint(equalTo: vertical.centerYAnchor).isActive = true
        }
    }
    
    func addMask(image: UIImage?){
        guard let image = image else {return}
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        addSubview(iv)
        iv.anchorFill(view: self)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }    
}
