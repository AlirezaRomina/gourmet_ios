//
//  PersonalCategoryController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

protocol PersonalCategoryDelegate {
    func itemSelected(_ personalCategoryController: PersonalCategoryController)
}

class PersonalCategoryController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet var recommendedLabelHeight: NSLayoutConstraint!
    @IBOutlet var featuredTable: UITableView!
    @IBOutlet var recommendedCollection: UICollectionView!
    @IBOutlet var recommendedHeightAnchor: NSLayoutConstraint!
    let recommendedCellId = "recommendedCellId"
    let featuredCellId = "featuredCellId"
    var delegate: PersonalCategoryDelegate?
    var editModeOn = false{
        didSet{
            recommendedCollection.reloadData()
        }
    }
    var recommendedItems = dummyItems
    var featuredItems =  dummyItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendedHeightAnchor.constant = 130 * designHeightRatio
        setupLongPressRecognizer()
    }
    
    private func setupLongPressRecognizer(){
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        lpgr.minimumPressDuration = 1.2
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        recommendedCollection.addGestureRecognizer(lpgr)
    }
    
    @objc private func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        guard gestureReconizer.state == .began else {return}
        editModeOn = !editModeOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        editModeOn = false
        if let index = featuredTable.indexPathForSelectedRow{
            featuredTable.deselectRow(at: index, animated: false)
        }
    }
}

extension PersonalCategoryController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedCellId, for: indexPath) as! RecommendedCollectionCell
        cell.delegate = self
        editModeOn ? cell.enableEditing() : cell.disableEditing()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemSelected(self)
    }
}

extension PersonalCategoryController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featuredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: featuredCellId, for: indexPath) as! FeaturedTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 * designHeightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.itemSelected(self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == featuredTable && !recommendedItems.isEmpty{
            let contentOffset = max(0,min(50,scrollView.contentOffset.y))
            recommendedHeightAnchor.constant = (130 * designHeightRatio) * (1 - contentOffset/100)
        }
    }
}

extension PersonalCategoryController: RecommendedCellDelegate{
    func deleteButtonPressed(cell: RecommendedCollectionCell) {
        recommendedCollection.performBatchUpdates({
            let indexPath = recommendedCollection.indexPath(for: cell)!
            recommendedCollection.deleteItems(at: [indexPath])
            recommendedItems.remove(at: indexPath.item)
        }) {
            guard $0 else {return}
            self.recommendedCollection.reloadData()
            if self.recommendedItems.isEmpty{
                self.recommendedHeightAnchor.constant = 0
                self.recommendedLabelHeight.constant = 0
                UIView.animate(withDuration: 0.6, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}
