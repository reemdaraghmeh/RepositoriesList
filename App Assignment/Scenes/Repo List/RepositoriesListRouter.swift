//
//  RepositoriesListRouter.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol RepositoriesListRoutable {
    func navigateToRepoDetails(_ repository: Repository)
}

class RepositoriesListRouter: RepositoriesListRoutable {
    
    //MARK: Injections
    weak var viewController: UIViewController?
    
    //MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    //MARK: RepositoriesListRoutable
    func navigateToRepoDetails(_ repository: Repository) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RepositoryDetailsViewController") as! RepositoryDetailsViewController
        controller.configurator = RepositoryDetailsConfigurator(repository: repository)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}


