//
//  ContributorCell.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol ContributorCellOutput {
    func set(name: String)
    func set(image: UIImage)
}

class ContributorCell: UITableViewCell ,ContributorCellOutput {
    
    @IBOutlet weak var contributorImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(name: String) {
        nameLabel.text = name
    }
    
    func set(image: UIImage) {
        contributorImage.image = image
    }
}
