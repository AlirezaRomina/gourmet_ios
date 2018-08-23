//
//  ItemCollectionFlowLayout.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class RecommendedCollectionFlowLayout: UICollectionViewFlowLayout {
    var zoomScale: CGFloat = 0.2
    var alphaFactor: CGFloat = 0.1
    
    override public func prepare() {
        super.prepare()
        if let collectionWidth = collectionView?.bounds.width, let collectionHeight = collectionView?.bounds.height {
            scrollDirection = .horizontal
            minimumLineSpacing = 3
            let safeAreaSpace: CGFloat = 5
            let cellWidth = collectionWidth * 150 / 414
            let cellHeight =  collectionHeight - safeAreaSpace
            self.itemSize = CGSize(width: cellWidth, height: cellHeight)
            self.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        invalidateLayout(with: invalidationContext(forBoundsChange: newBounds))
        return super.shouldInvalidateLayout(forBoundsChange: newBounds)
    }
    
    //For scaling : cells will be scaled and alpha will be changed
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let collectionView = collectionView else { return nil}
        
        let visibleRect: CGRect = CGRect(x: collectionView.contentOffset.x, y: collectionView.contentOffset.y, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        guard let layoutAttributes: [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let layoutAttributesCopy : [UICollectionViewLayoutAttributes] = NSArray(array: layoutAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
        let intersectAttributes: [UICollectionViewLayoutAttributes] = layoutAttributesCopy.filter {$0.frame.intersects(rect)}
        _ = intersectAttributes.map { (attribute: UICollectionViewLayoutAttributes) in
            let distance: CGFloat = visibleRect.midX - (attribute.center.x )
            let activeDistance  = collectionView.bounds.width
            let normalizedDistance: CGFloat = distance / activeDistance
            if abs(distance) < activeDistance {
                
                let zoom: CGFloat = (1 / (1 + zoomScale * abs(normalizedDistance)))
                attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
                attribute.zIndex = 1
                
                let cellAlpha = (1 / (1 + alphaFactor * abs(normalizedDistance)))
                attribute.alpha = cellAlpha
            }
        }
        return layoutAttributesCopy
    }
}
