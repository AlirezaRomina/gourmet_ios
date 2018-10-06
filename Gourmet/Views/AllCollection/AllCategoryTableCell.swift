//
//  AllCollectionViewCell.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class AllCategoryTableCell: UITableViewCell {
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var header: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var ratingStar: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingStar.settings.textFont = UIFont.boldSystemFont(ofSize: 10)
        itemImage.layer.cornerRadius = 8
    }
}
