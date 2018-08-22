//
//  CategoriesFlowLayout.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class CategoryCollectionFlowLayout: UICollectionViewFlowLayout {
    
    var zoomScale: CGFloat = 0.2
    var alphaFactor: CGFloat = 0.8
    
    override public func prepare() {
        super.prepare()
        if let collectionWidth = collectionView?.bounds.width, let collectionHeight = collectionView?.bounds.height {
            scrollDirection = .horizontal
            minimumLineSpacing = -5
            let safeAreaSpace: CGFloat = 5
            let cellWidth = collectionWidth * 340 / 414
            let cellHeight =  collectionHeight - safeAreaSpace
            self.itemSize = CGSize(width: cellWidth, height: cellHeight)
            self.sectionInset = UIEdgeInsets(top: 0, left: (collectionWidth - cellWidth) / 2, bottom: 0, right: (collectionWidth - cellWidth) / 2)
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
    
    //For pagination: cells will be in the center
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var offsetAdjustment: CGFloat = CGFloat(MAXFLOAT)
        
        if let collectionView = collectionView {
            
            let horizontalCenter: CGFloat = proposedContentOffset.x + ((collectionView.bounds.width) / 2)
            let targetRect = CGRect(x: proposedContentOffset.x, y: 0.0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
            
            if let attributesArray = super.layoutAttributesForElements(in: targetRect) {
                attributesArray.forEach { layoutAttribute in
                    let itemHorizontalCenter: CGFloat? = layoutAttribute.center.x
                    if abs((itemHorizontalCenter ?? 0.0) - horizontalCenter) < abs(offsetAdjustment) {
                        offsetAdjustment = (itemHorizontalCenter ?? 0.0) - horizontalCenter
                    }
                }
            }
            return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
        }
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
        
    }
}
