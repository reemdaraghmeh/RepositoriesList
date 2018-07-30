//
//  RepositoryDetailsConfigurator.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol RepositoryDetailsConfigurable {
    func configure(viewController: RepositoryDetailsViewController)
}

class RepositoryDetailsConfigurator: RepositoryDetailsConfigurable {

    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    //MARK: RepositoryDetailsConfigurable
    func configure(viewController: RepositoryDetailsViewController) {
    
        let router = RepositoryDetailsRouter(viewController: viewController)
        
        let presenter = RepositoryDetailsPresenter(
            output: viewController,
            router: router
        )
        
        viewController.presenter = presenter

    }
}
