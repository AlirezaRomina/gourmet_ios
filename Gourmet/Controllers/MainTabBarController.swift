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
        self.delegate = self
        setupViewControllers()
    }
    
    func setupViewControllers(){
        //Home
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: MenuController())
        
        //Search
        let searchNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"))
        
        //QRCode
        let qrcodeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "qrcode_unselected"), selectedImage: #imageLiteral(resourceName: "qrcode_selected"))
        
        //Location
        let locationNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "location_unselected"), selectedImage: #imageLiteral(resourceName: "location_selected"))
        
        //Profile
        let profileNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"))
        
        tabBar.tintColor = .black
        viewControllers = [homeNavController,
                           searchNavController,
                           qrcodeNavController,
                           locationNavController,
                           profileNavController]
        
        // Modify tab bar insets
        guard let items = tabBar.items else {return}
        for item in items{
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController{
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
