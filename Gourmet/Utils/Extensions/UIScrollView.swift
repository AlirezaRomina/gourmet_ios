//
//  UIScrollView.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

extension UIScrollView{
    func addViews(views: [UIView], width: CGFloat){
        for (index,view) in views.enumerated(){
            addSubview(view)
            let anchorLeft = index == 0 ? leftAnchor : views[index-1].rightAnchor
            view.anchor(top: topAnchor, left: anchorLeft, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: 0)
            view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
    }
}
