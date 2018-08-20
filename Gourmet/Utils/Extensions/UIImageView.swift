//
//  UIImageView.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

extension UIImageView {
    func gradated(gradientPoints: [GradientPoint]) {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = frame
        gradientMaskLayer.colors = gradientPoints.map { $0.color.cgColor }
        gradientMaskLayer.locations = gradientPoints.map { $0.location as NSNumber }
        self.layer.insertSublayer(gradientMaskLayer, at: 0)
    }
    //        let points = [GradientPoint(location: 1, color: #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 0.6)), GradientPoint(location: 0.5, color: .clear)]
    //        backgroundImageView.addMask(image: UIImage(size: frame.size, gradientPoints: points))

}
