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

class PersonalCategoryController: UIViewController {
    let recommendedCellId = "recommendedCellId"
    let featuredCellId = "featuredCellId"
    var delegate: PersonalCategoryDelegate?
    var recommendedItems: [Item]?{
        didSet{
            
        }
    }
    var featuredItems: [Item]?{
        didSet{
            
        }
    }
    
    let recomendedHeader: UILabel = {
        let label = UILabel()
        label.text = "Recommended For You"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let featuredHeader: UILabel = {
        let label = UILabel()
        label.text = "Featured Items"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var recomendedCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: RecommendedCollectionFlowLayout())
        cv.backgroundColor = .white
        cv.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: recommendedCellId)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    lazy var featuredTableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero)
        tv.backgroundColor = .white
        tv.register(FeaturedTableViewCell.self, forCellReuseIdentifier: featuredCellId)
        tv.delegate = self
        tv.dataSource = self
        tv.showsHorizontalScrollIndicator = false
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recomendedHeader)
        recomendedHeader.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 8 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(recomendedCollectionView)
        recomendedCollectionView.anchor(top: recomendedHeader.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 170 * designHeightRatio)
        view.addSubview(featuredHeader)
        featuredHeader.anchor(top: recomendedCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 4 * designHeightRatio, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(featuredTableView)
        featuredTableView.anchor(top: featuredHeader.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 4 * designHeightRatio, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = featuredTableView.indexPathForSelectedRow{
            featuredTableView.deselectRow(at: index, animated: false)
        }
    }
}


extension PersonalCategoryController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedCellId, for: indexPath) as! RecommendedCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemSelected(self)
    }
     
}

extension PersonalCategoryController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: featuredCellId, for: indexPath) as! FeaturedTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 * designHeightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.itemSelected(self)
    }
    
   
}
