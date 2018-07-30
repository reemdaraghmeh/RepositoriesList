//
//  RepositoryDetailsViewController.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    // MARK: Outlets
    
    
    // MARK: Injections
    var presenter: RepositoryDetailsPresenterInput!
    var configurator: RepositoryDetailsConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }

    
}

// MARK: - RepositoryDetailsPresenterOutput
extension RepositoryDetailsViewController: RepositoryDetailsPresenterOutput {

}
