//
//  LabelCell.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol LabelCellOutput {
    func setLabel(value: String)
}

class LabelCell: UITableViewCell ,LabelCellOutput {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setLabel(value: String) {
        headerLabel.text = value
    }
    
}
