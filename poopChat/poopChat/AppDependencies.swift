//
//  AppDependencies.swift
//  poopChat
//
//  Created by Nicholas Alekhine on 1/24/15.
//  Copyright (c) 2015 PoopChat. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    // MARK: - define all wireframes
    
    var homeWireframe = HomeWireframe()
    
    // MARK: - initialization
    
    init() {
        configureDependencies()
    }
    
    // MARK: - functions
    
    func installTabbedViewControllersIntoWindow(window: UIWindow){
        homeWireframe.presentHomeInterfaceFromWindow(window)
    }
    
    // defines relationships between wireframes.
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        // MARK: - Home Modules
        let homePresenter = HomePresenter()
        let homeInteractor = HomeInteractor()
        
        homeInteractor.presenter = homePresenter
        homePresenter.interactor = homeInteractor
        homePresenter.wireframe = homeWireframe
        
        // instantiate wireframes
        homeWireframe.presenter = homePresenter
        homeWireframe.rootWireframe = rootWireframe
    }
}