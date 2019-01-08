//
//  Application.swift
//  CleanArchitecture
//
//  Created by TriNgo on 1/8/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import Domain
import NetworkPlatform
import CoreDataPlatform

final class Application {
    static let shared = Application()
    
    private let coreDataUseCaseProvider: Domain.UseCaseProvider
    private let networkUseCaseProvider: Domain.UseCaseProvider
    
    private init() {
        self.coreDataUseCaseProvider = CoreDataPlatform.UseCaseProvider()
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // CoreData navigation
        let cdNavigationController = UINavigationController()
        cdNavigationController.tabBarItem = UITabBarItem(title: "CoreData",
                                                         image: UIImage.init(named: "Box"),
                                                         selectedImage: nil)
        let cdNavigator = DefaultPostsNavigator(services: coreDataUseCaseProvider,
                                                navigationController: cdNavigationController,
                                                storyBoard: storyboard)
        
        // Network navigation
        let networkNavigatorController = UINavigationController()
        networkNavigatorController.tabBarItem = UITabBarItem(title: "Network",
                                                             image: UIImage.init(named: "Toolbox"),
                                                             selectedImage: nil)
        let networkNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                                                     navigationController: networkNavigatorController,
                                                     storyBoard: storyboard)
        
        // Init tab bar controller
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            cdNavigationController,
            networkNavigatorController
        ]
        window.rootViewController = tabBarController
        
        cdNavigator.toPosts()
        networkNavigator.toPosts()
    }
}
