//
//  MenuController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var categoryCollection: UICollectionView!
    @IBOutlet var segmentedControl: CustomSegmentedControl!
    @IBOutlet var containerScroll: UIScrollView!
    
    let cellId = "categoryCell"
    var restaurantId: Int64!
    var categories = [Category]()
    var allCategoryController: AllCategoryController!
    var personalCategoryController: PersonalCategoryController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "İstinye Burger Salonu"
        segmentedControl.delegate = self
        allCategoryController.delegate = self
        personalCategoryController.delegate = self
    }
   
    func getCategories(){
        // TODO
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonalCategoryController", let vc = segue.destination as? PersonalCategoryController{
            self.personalCategoryController = vc
        }
        if segue.identifier == "toAllCategoryController", let vc = segue.destination as? AllCategoryController{
            self.allCategoryController = vc
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
}

extension MenuController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCollectionCell
        return cell
    }
}

extension MenuController: UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = categoryCollection.getMidVisibleIndexPath(),
            scrollView == categoryCollection else {return}
        print(indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == containerScroll else {return}
        let ratio = scrollView.contentOffset.x / scrollView.contentSize.width
        guard !ratio.isNaN, !ratio.isInfinite else {return}
        segmentedControl.animateSelectedLine(to: ratio * CGFloat(segmentedControl.segmentTitles.count))
    }
}

extension MenuController: CustomSegmentedControlDelegate{
    func segmentSelected(segmentedController: CustomSegmentedControl, selectedIndex: Int) {
        let horizontalOffset = CGFloat(selectedIndex) * view.bounds.width
        containerScroll.setContentOffset(CGPoint(x: horizontalOffset, y:0) , animated: true)
    }
   
}
extension MenuController: AllCategoryDelegate, PersonalCategoryDelegate{
    func itemSelected(_ allCategoryController: AllCategoryController) {
        performSegue(withIdentifier: "toItemDetail", sender: nil)
    }
    func itemSelected(_ personalCategoryController: PersonalCategoryController) {
        performSegue(withIdentifier: "toItemDetail", sender: nil)
    }
}
