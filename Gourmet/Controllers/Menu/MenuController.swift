//
//  MenuController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    let cellId = "categoriesCell"
    
    lazy var categoriesCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: CategoriesFlowLayout())
        cv.backgroundColor = .white
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    let segmentedControl: CustomSegmentedControl = {
        let sc = CustomSegmentedControl(segmentTitles: ["All", "For You"])
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(categoriesCollectionView)
        let ratio = min(designHeightRatio, 1)
        categoriesCollectionView.anchor(top: guide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15 * ratio, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 170 * ratio)
        
        segmentedControl.delegate = self
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: categoriesCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30)
        
    }
}

extension MenuController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCollectionViewCell
        return cell
    }
}

extension MenuController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension MenuController: CustomSegmentedControlDelegate{
    func segmentSelected(segmentedController: CustomSegmentedControl, selectedIndex: Int) {
        print(selectedIndex)
    }
}
