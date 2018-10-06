//
//  MainTabBarController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 19.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
    }
    
    func setupViewControllers(){
        tabBar.tintColor = .black
        guard let viewControllers = self.viewControllers as? [UINavigationController] else {return}
        let tabBarIconArray: [(unselected: UIImage,selected: UIImage)] = [(#imageLiteral(resourceName: "home_unselected"),#imageLiteral(resourceName: "home_selected")),(#imageLiteral(resourceName: "search_unselected"),#imageLiteral(resourceName: "search_selected")),(#imageLiteral(resourceName: "qrcode_unselected"),#imageLiteral(resourceName: "qrcode_selected")),(#imageLiteral(resourceName: "location_unselected"),#imageLiteral(resourceName: "location_selected")),(#imageLiteral(resourceName: "profile_unselected"),#imageLiteral(resourceName: "profile_selected"))]
        for (index,viewController) in viewControllers.enumerated(){
            viewController.tabBarItem.image = tabBarIconArray[index].unselected
            viewController.tabBarItem.selectedImage = tabBarIconArray[index].selected
            viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
