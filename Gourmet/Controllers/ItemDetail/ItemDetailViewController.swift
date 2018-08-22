//
//  ItemDetailViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let recommendedCellId = "recommendedCellId"
    let itemImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "hamburger")
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "Texas Steak House with onion"
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "$20"
        return label
    }()
    
    let ratingStarView: CosmosView = {
        let cv = CosmosView()
        cv.settings.filledImage = #imageLiteral(resourceName: "star_filled")
        cv.settings.emptyImage = #imageLiteral(resourceName: "star_unfilled")
        cv.settings.updateOnTouch = false
        cv.settings.fillMode = .precise
        cv.settings.starSize = 10
        cv.settings.starMargin = 2
        cv.rating = 3.5
        cv.text = "(52)"
        cv.totalStars = 5
        cv.textColor = .white
        cv.settings.textFont = UIFont.boldSystemFont(ofSize: 10)
        return cv
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
    
    lazy var featuredTableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero)
        tv.backgroundColor = .white
        tv.register(FeaturedTableViewCell.self, forCellReuseIdentifier: recommendedCellId)
        tv.delegate = self
        tv.dataSource = self
        tv.showsHorizontalScrollIndicator = false
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    let segmentedControl: CustomSegmentedControl = {
        let sc = CustomSegmentedControl(segmentTitles: ["Info", "Similar Items", "Rate"])
        return sc
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
        let safeArea = view.safeAreaLayoutGuide
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = .white
        view.addSubview(itemImageView)
        itemImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor, multiplier: 1 * designHeightRatio).isActive = true
        view.layoutSubviews()
        let points = [GradientPoint(location: 1, color: #colorLiteral(red: 0.8941176471, green: 0.2274509804, blue: 0.3294117647, alpha: 1)), GradientPoint(location: 0.4, color: .clear),  GradientPoint(location: 0, color: .clear)]
        itemImageView.addMask(image: UIImage(size: itemImageView.frame.size, gradientPoints: points))
        
        
        view.addSubview(arviewButton)
        arviewButton.anchor(top: itemImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60 * designHeightRatio)
        view.sendSubviewToBack(arviewButton)
        
        view.addSubview(backButton)
        backButton.anchor(top: safeArea.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 28, height: 28)
        
        view.addSubview(segmentedControl)
          segmentedControl.anchor(top: arviewButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 12 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 30 * designHeightRatio)

        view.addSubview(featuredTableView)
        featuredTableView.anchor(top: segmentedControl.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15 * designWidthRatio, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

extension ItemDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: recommendedCellId, for: indexPath) as! FeaturedTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 * designHeightRatio
    }
    
    
}
