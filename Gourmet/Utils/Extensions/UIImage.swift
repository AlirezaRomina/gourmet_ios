//
//  UIImage.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class GradientPoint<C>: NSObject {
    var location: CGFloat
    var color: C
    
    init(location: CGFloat, color: C) {
        self.location = location
        self.color = color
    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    static func image(withGradientPoints gradientPoints: [GradientPoint<[CGFloat]>], colorSpace: CGColorSpace, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        guard
            let context = UIGraphicsGetCurrentContext(),
            let gradient = CGGradient(colorSpace: colorSpace,
                                      colorComponents: gradientPoints.flatMap { $0.color },
                                      locations: gradientPoints.map { $0.location }, count: gradientPoints.count) else {
                                        return nil
        }
        
        context.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: 0, y: size.height), options: CGGradientDrawingOptions())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func image(withRGBAGradientPoints gradientPoints: [GradientPoint<RGBA>], size: CGSize) -> UIImage? {
        return image(withGradientPoints: gradientPoints.map {
            GradientPoint(location: $0.location, color: [$0.color.red, $0.color.green, $0.color.blue, $0.color.alpha])
        }, colorSpace: CGColorSpaceCreateDeviceRGB(), size: size)
    }
    
    static func image(withRGBAGradientColors gradientColors: [CGFloat: RGBA], size: CGSize) -> UIImage? {
        return image(withRGBAGradientPoints: gradientColors.map {  GradientPoint(location: $0, color: $1)}, size: size)
    }
    
    static func image(withGrayscaleGradientPoints gradientPoints: [GradientPoint<Grayscale>], size: CGSize) -> UIImage? {
        return image(withGradientPoints: gradientPoints.map {
            GradientPoint(location: $0.location, color: [$0.color.white, $0.color.alpha]) },
                     colorSpace: CGColorSpaceCreateDeviceGray(), size: size)
    }
    
    static func image(withGrayscaleGradientColors gradientColors: [CGFloat: Grayscale], size: CGSize) -> UIImage? {
        return image(withGrayscaleGradientPoints: gradientColors.map { GradientPoint(location: $0, color: $1) }, size: size)
    }
}





