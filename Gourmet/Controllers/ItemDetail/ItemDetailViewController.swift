//
//  ItemDetailViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let infoViewController = InfoViewController()
    let similarTableViewController = SimilarTableViewController()
    let rateViewController = RateViewController()

    let itemImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        return iv
    }()
    
    let arviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gourmetPurple
        button.setTitle("AR View", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(white: 0, alpha: 0.2)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.setImage(#imageLiteral(resourceName: "ic_back_btn"), for: .normal)
        button.addTarget(self, action: #selector(pop), for: .touchUpInside)
        button.contentMode = .scaleAspectFill
        button.tintColor = .white
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    
    lazy var segmentedControl: CustomSegmentedControl = {
        let sc = CustomSegmentedControl(segmentTitles: ["Info", "Similar Items", "Rate"])
        sc.delegate = self
        return sc
    }()
    
    lazy var containerScrollView: UIScrollView = {
        let sv =  UIScrollView(frame: CGRect.zero)
        sv.backgroundColor = .clear
        sv.contentSize.width = view.bounds.width * 3
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.bounces = false
        sv.isPagingEnabled = true
        sv.delegate = self
        return sv
    }()
    
    @objc func pop(){
        navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let guide = view.safeAreaLayoutGuide
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = .white
        view.addSubview(itemImageView)
        itemImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor, multiplier: (0.9 - 60/view.bounds.width) * designHeightRatio).isActive = true
        view.layoutSubviews()
        let gradientImage = UIImage.image(withRGBAGradientColors: [1: RGBA(color: .gourmetPurple), 0.5: RGBA(color: .clear)], size: itemImageView.bounds.size)
        itemImageView.addMask(image: gradientImage)
    
        view.addSubview(arviewButton)
        arviewButton.anchor(top: itemImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60 * designHeightRatio)
        view.sendSubviewToBack(arviewButton)
        
        view.addSubview(backButton)
        backButton.anchor(top: guide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 28, height: 28)
        
        view.addSubview(segmentedControl)
          segmentedControl.anchor(top: arviewButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 12 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30 * designHeightRatio)

        view.addSubview(containerScrollView)
        containerScrollView.anchor(top: segmentedControl.bottomAnchor, left: view.leftAnchor, bottom: guide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addChild(viewControllers: [infoViewController,similarTableViewController,rateViewController])
        containerScrollView.addViews(views: [infoViewController.view, similarTableViewController.view, rateViewController.view], width: view.bounds.width)
    }
   
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension ItemDetailViewController: CustomSegmentedControlDelegate, UIScrollViewDelegate{
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
