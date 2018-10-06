//
//  ItemCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

protocol RecommendedCellDelegate{
    func deleteButtonPressed(cell: RecommendedCollectionCell)
}

class RecommendedCollectionCell: UICollectionViewCell {
   
    @IBOutlet var background: UIImageView!
    @IBOutlet var deleteButton: UIButton!
    
    var delegate: RecommendedCellDelegate?
    var imageUrl: String?
    
    @IBAction func deleteCell(_ sender: Any) {
        delegate?.deleteButtonPressed(cell: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        layer.masksToBounds = true
        background.layer.cornerRadius = 8
        deleteButton.layer.cornerRadius = 12
        let gradientImage = UIImage.image(withRGBAGradientColors: [1: RGBA(color: .gourmetPurple), 0.6: RGBA(color: .clear)], size: contentView.bounds.size)
        background.addMask(image: gradientImage)
    }
    
    func enableEditing() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        let startAngle: Float = (-1) * 3.14159/180
        let stopAngle = -startAngle
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.2
        shakeAnimation.repeatCount = 10000
        shakeAnimation.timeOffset = 290 * drand48()
        layer.add(shakeAnimation, forKey:"shaking")
        deleteButton.isHidden = false
    }
    
    func disableEditing() {
        layer.removeAnimation(forKey: "shaking")
        deleteButton.isHidden = true
    }

}
