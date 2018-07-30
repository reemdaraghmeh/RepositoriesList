//
//  RepositoriesListConfigurator.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol RepositoriesListConfigurable {
    func configure(viewController: RepositoriesListViewController)
}

class RepositoriesListConfigurator: RepositoriesListConfigurable {

    //MARK: RepositoriesListConfigurable
    func configure(viewController: RepositoriesListViewController) {
    
        let router = RepositoriesListRouter(viewController: viewController)
        
        let presenter = RepositoriesListPresenter(
            output: viewController,
            router: router
        )
        
        viewController.presenter = presenter

    }
}
