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
    
    let recomendedDescription: UILabel = {
        let label = UILabel()
        label.text = "Special Edition"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
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
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: ItemCollectionFlowLayout())
        cv.backgroundColor = .white
        cv.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    lazy var featuredCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        cv.backgroundColor = .white
        cv.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
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
        recomendedHeader.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 10 * ratio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(recomendedDescription)
        recomendedDescription.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 10 * ratio, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 0, height: 0)
        view.addSubview(recomendedCollectionView)
        recomendedCollectionView.anchor(top: recomendedHeader.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 170 * ratio)
        view.addSubview(featuredHeader)
        featuredHeader.anchor(top: recomendedCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5 * ratio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}


extension PersonalCategoryController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    
}

extension PersonalCategoryController: UICollectionViewDelegate{
    
}
