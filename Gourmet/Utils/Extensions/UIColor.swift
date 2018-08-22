//
//  UIColor.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

extension UIColor {
    static let gourmetPurple = #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 1)           //UIColor(hex: "#e43a54")
    static let gourmetOrange = #colorLiteral(red: 0.9960784314, green: 0.5803921569, blue: 0, alpha: 1)        //UIColor(hex: "#ff9500")
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}

class RGBA: NSObject {
    let channelDivider: CGFloat = 255
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
    
    init(color: UIColor){
        self.red = CGFloat(color.rgb()?.red ?? 0)/channelDivider
        self.green = CGFloat(color.rgb()?.green ?? 0)/channelDivider
        self.blue = CGFloat(color.rgb()?.blue ?? 0)/channelDivider
        self.alpha = CGFloat(color.rgb()?.alpha ?? 0)/channelDivider
    }
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    init(intRed: Int, green: Int, blue: Int, alpha: Int) {
        self.red = CGFloat(intRed)/channelDivider
        self.green = CGFloat(green)/channelDivider
        self.blue = CGFloat(blue)/channelDivider
        self.alpha = CGFloat(alpha)/channelDivider
    }
}

class Grayscale: NSObject {
    var white: CGFloat
    var alpha: CGFloat
    
    init(white: CGFloat, alpha: CGFloat) {
        self.white = white
        self.alpha = alpha
    }
}

