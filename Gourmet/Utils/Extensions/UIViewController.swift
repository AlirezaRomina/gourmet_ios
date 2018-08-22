//
//  UIViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func addChild(viewControllers: [UIViewController]){
        viewControllers.forEach {
            addChild($0)
            $0.didMove(toParent: self)
        }
    }
}
