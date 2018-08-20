//
//  UIColor.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let gourmetPurple = #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 1)           //UIColor(hex: "#e43a54")
    static let gourmetOrange = #colorLiteral(red: 0.9960784314, green: 0.5803921569, blue: 0, alpha: 1)        //UIColor(hex: "#ff9500")
    
}
