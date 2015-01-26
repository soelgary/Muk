//
//  RootWireframe.swift
//  poopChat
//
//  Created by Nicholas Alekhine on 1/24/15.
//  Copyright (c) 2015 PoopChat. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe: NSObject, UITabBarDelegate {
    
    func showRootViewController(viewController: UIViewController, window: UIWindow) {
        var tabBarController = tabBarControllerFromWindow(window)
        var viewControllers = tabBarController.viewControllers
        if viewControllers == nil {
            viewControllers = []
        }
        viewControllers?.append(viewController)
        tabBarController.viewControllers = viewControllers
    }
    
    private func tabBarControllerFromWindow(window: UIWindow) -> UITabBarController {
        var tabBarController = window.rootViewController! as UITabBarController
        return tabBarController
    }
}