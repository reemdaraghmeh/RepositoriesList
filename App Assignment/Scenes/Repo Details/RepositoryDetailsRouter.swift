//
//  RepositoryDetailsRouter.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol RepositoryDetailsRoutable {
    
}

class RepositoryDetailsRouter: RepositoryDetailsRoutable {
    
    //MARK: Injections
    weak var viewController: UIViewController?
    
    //MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    //MARK: RepositoryDetailsRoutable

}


