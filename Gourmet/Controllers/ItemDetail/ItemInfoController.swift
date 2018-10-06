//
//  ItemInfoViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class ItemInfoController: UIViewController {
    
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var ratingStarView: CosmosView!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var caloriLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var veganImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingStarView.settings.textFont = UIFont.boldSystemFont(ofSize: 14)
        veganImageView.image = UIImage(named: "ic_check")?.withRenderingMode(.alwaysTemplate)
        veganImageView.tintColor = .green
    }
}
