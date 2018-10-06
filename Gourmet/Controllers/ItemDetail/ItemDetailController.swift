//
//  ItemDetailViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var segmentedControl: CustomSegmentedControl!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var arviewButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var containerScrollView: UIScrollView!

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var itemInfoController: ItemInfoController!
    var itemRateController: ItemRateController!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
        segmentedControl.delegate = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        let gradientImage = UIImage.image(withRGBAGradientColors: [1: RGBA(color: .gourmetPurple), 0.5: RGBA(color: .clear)], size: itemImageView.bounds.size)
        itemImageView.addMask(image: gradientImage)
//        _ = ws?.getRestaurant(restaurantId: 1).done({ (<#Restaurant#>) in
//            <#code#>
//        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemInfo", let vc = segue.destination as? ItemInfoController{
            itemInfoController = vc
        }
        if segue.identifier == "toItemRate", let vc = segue.destination as? ItemRateController{
            itemRateController = vc
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension ItemDetailController: CustomSegmentedControlDelegate, UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == containerScrollView else {return}
        let ratio = scrollView.contentOffset.x / scrollView.contentSize.width
        guard !ratio.isNaN, !ratio.isInfinite else {return}
        segmentedControl.animateSelectedLine(to: ratio * CGFloat(segmentedControl.segmentTitles.count))
    }
    
    func segmentSelected(segmentedController: CustomSegmentedControl, selectedIndex: Int) {
        let horizontalOffset = CGFloat(selectedIndex) * view.bounds.width
        containerScrollView.setContentOffset(CGPoint(x: horizontalOffset, y:0) , animated: true)
    }
}
