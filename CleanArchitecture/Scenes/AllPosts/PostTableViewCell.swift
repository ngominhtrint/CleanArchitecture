//
//  PostTableViewCell.swift
//  CleanArchitecture
//
//  Created by TriNgo on 1/8/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    func bind(_ viewModel: PostItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.detailsLabel.text = viewModel.subtitle
    }
}
