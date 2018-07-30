//
//  RepositoryDetailsPresenter.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import Foundation

protocol RepositoryDetailsPresenterInput: BasePresenterInput {
    
    var router: RepositoryDetailsRoutable { get }
    
}

protocol RepositoryDetailsPresenterOutput {
    
}

class RepositoryDetailsPresenter:  RepositoryDetailsPresenterInput {
    
    //MARK: Injections
    private var output: RepositoryDetailsPresenterOutput?
    var router: RepositoryDetailsRoutable
    
    //MARK: LifeCycle 
    init(output: RepositoryDetailsPresenterOutput,
         router: RepositoryDetailsRoutable) {
        
        self.output = output
        self.router = router
    }
    
    //MARK: RepositoryDetailsPresenterInput
    func viewDidLoad() {
        
    }
}


