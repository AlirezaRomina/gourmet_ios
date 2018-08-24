//
//  MenuController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UIGestureRecognizerDelegate {
    let cellId = "categoriesCell"
    var restaurantId: Int64!
    var categories = [Category]()
    let allCategoryController = AllCategoryController()
    let personalCategoryController = PersonalCategoryController()
   
    lazy var categoriesCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: CategoryCollectionFlowLayout())
        cv.backgroundColor = .white
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    let segmentedControl: CustomSegmentedControl = {
        let sc = CustomSegmentedControl(segmentTitles: ["All", "Personal"])
        return sc
    }()
    
    lazy var containerScrollView: UIScrollView = {
        let sv =  UIScrollView(frame: CGRect.zero)
        sv.backgroundColor = .clear
        sv.contentSize.width = view.bounds.width * 2
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.bounces = false
        sv.isPagingEnabled = true
        sv.delegate = self
        return sv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCategoryController.delegate = self
        personalCategoryController.delegate = self
        view.backgroundColor = .white
        navigationItem.title = "Restaurant Name"
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(categoriesCollectionView)
        categoriesCollectionView.anchor(top: guide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10 * designHeightRatio, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 170 * designHeightRatio)
        
        segmentedControl.delegate = self
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: categoriesCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30 * designHeightRatio)
        
        view.addSubview(containerScrollView)
        containerScrollView.anchor(top: segmentedControl.bottomAnchor, left: view.leftAnchor, bottom: guide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        containerScrollView.addViews(views: [allCategoryController.view,personalCategoryController.view], width: view.bounds.width)
        addChild(viewControllers: [allCategoryController,personalCategoryController])
    }
   
    func getCategories(){
        // TODO
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
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = categoriesCollectionView.getMidVisibleIndexPath(),
            scrollView == categoriesCollectionView else {return}
        print(indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == containerScrollView else {return}
        let ratio = scrollView.contentOffset.x / scrollView.contentSize.width
        guard !ratio.isNaN, !ratio.isInfinite else {return}
        segmentedControl.animateSelectedLine(to: ratio * CGFloat(segmentedControl.segmentTitles.count))
    }

}

extension MenuController: CustomSegmentedControlDelegate{
    func segmentSelected(segmentedController: CustomSegmentedControl, selectedIndex: Int) {
        let horizontalOffset = CGFloat(selectedIndex) * view.bounds.width
        containerScrollView.setContentOffset(CGPoint(x: horizontalOffset, y:0) , animated: true)
    }
   
}
extension MenuController: AllCategoryDelegate, PersonalCategoryDelegate{
    func itemSelected(_ allCategoryController: AllCategoryController) {
        let vc = ItemDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func itemSelected(_ personalCategoryController: PersonalCategoryController) {
        let vc = ItemDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
