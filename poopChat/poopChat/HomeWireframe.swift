//
//  HomeWireframe.swift
//  poopChat
//
//  Created by Nicholas Alekhine on 1/24/15.
//  Copyright (c) 2015 PoopChat. All rights reserved.
//

import Foundation
import UIKit

class HomeWireframe: NSObject {
    
    // MARK: - view id's
    let HomeNavControllerID = "HomeNavController"
    let messengerTableVCID = "messengerTableView"
    
    var presenter: HomePresenter!
    var rootWireframe: RootWireframe!
    
    var messengerTableViewController: MessengerTableViewController?
    
    var navController : UINavigationController?
    
    /**
    Presents the Home Module in the main storyboard
    
    :param: window UIWindow
    */
    func presentHomeInterfaceFromWindow(window: UIWindow) {
        var navController = navControllerFromStoryboard()
        var messengerTableVC = MessengerTableViewControllerFromStoryboard()
        messengerTableVC.presenter = presenter
        
        self.presenter.userInterface = messengerTableVC;
        self.messengerTableViewController = messengerTableVC
        
        rootWireframe.showRootViewController(self.messengerTableViewController!, window: window)
    }
    
    func MessengerTableViewControllerFromStoryboard() -> MessengerTableViewController {
        var storyboard = HomeStoryboard()
        var viewController = storyboard.instantiateViewControllerWithIdentifier(messengerTableVCID) as MessengerTableViewController
        return viewController
    }
    
    func navControllerFromStoryboard() -> UINavigationController {
        if navController == nil {
            let storyboard = HomeStoryboard()
            let viewController = storyboard.instantiateViewControllerWithIdentifier(HomeNavControllerID) as UINavigationController
            self.navController = viewController
        }
        return self.navController!
    }
    
    func HomeStoryboard() -> UIStoryboard {
        var storyboard = UIStoryboard(name: "Home", bundle: NSBundle.mainBundle())
        return storyboard
    }
}