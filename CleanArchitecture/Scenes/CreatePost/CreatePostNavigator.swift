//
//  CreatePostNavigator.swift
//  CleanArchitecture
//
//  Created by TriNgo on 1/8/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol CreatePostNavigator {
    
    func toPosts()
}

final class DefaultCreatePostNavigator: CreatePostNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toPosts() {
        navigationController.dismiss(animated: true)
    }
}
