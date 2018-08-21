//
//  PersonalCategoryController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class PersonalCategoryController: UIViewController {
    let cellId = "itemListCollectionCell"
    
    let recomendedHeader: UILabel = {
        let label = UILabel()
        label.text = "Recommended Items"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let featuredHeader: UILabel = {
        let label = UILabel()
        label.text = "Featured Items"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var recomendedCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: RecommendedCollectionFlowLayout())
        cv.backgroundColor = .white
        cv.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    lazy var featuredCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let horizontalPadding: CGFloat = 15
        let ratio = min(designHeightRatio, 1)
        flowLayout.itemSize = CGSize(width: (view.bounds.width - 2 * horizontalPadding)/2, height: 65 * ratio)
        flowLayout.minimumLineSpacing = 10 * designHeightRatio
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ratio = min(designHeightRatio, 1)
        view.addSubview(recomendedHeader)
        recomendedHeader.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 8 * ratio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(recomendedCollectionView)
        recomendedCollectionView.anchor(top: recomendedHeader.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 170 * ratio)
        view.addSubview(featuredHeader)
        featuredHeader.anchor(top: recomendedCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 4 * ratio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(featuredCollectionView)
        featuredCollectionView.anchor(top: featuredHeader.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 4 * ratio, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
    }
}


extension PersonalCategoryController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == recomendedCollectionView ? 8 :  4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? RecommendedCollectionViewCell{
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeaturedCollectionViewCell
            return cell
        }
        
    }
    
    
}

extension PersonalCategoryController: UICollectionViewDelegate{
    
}
