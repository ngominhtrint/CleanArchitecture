//
//  EditPostNavigator.swift
//  CleanArchitecture
//
//  Created by TriNgo on 1/8/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol EditPostNavigator {
    
    func toPosts()
}

final class DefaultEditPostNavigator: EditPostNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toPosts() {
        navigationController.popViewController(animated: true)
    }
}
