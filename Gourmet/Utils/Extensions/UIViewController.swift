//
//  UIViewController.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 22.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

extension UIViewController{
    
    var ws: WebService? {
        return Module.container.resolve(WebService.self)
    }
    
    var cs: ClientSession?{
        return Module.container.resolve(ClientSession.self)
    }
    
    func addChild(viewControllers: [UIViewController]){
        viewControllers.forEach {
            addChildViewController($0)
            $0.didMove(toParentViewController: self)
        }
    }
    
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
