//
//  RepositoriesListPresenter.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import Foundation

protocol RepositoriesListPresenterInput: BasePresenterInput {
    
    var router: RepositoriesListRoutable { get }
    func numberOfRows() -> Int
    func configure(cell: LabelCellOutput, for index: Int)
    func didSelectRowAt(index: Int)
}

protocol RepositoriesListPresenterOutput {
    func displayScreen(title: String)
}

class RepositoriesListPresenter:  RepositoriesListPresenterInput {
    
    //MARK: Injections
    private var output: RepositoriesListPresenterOutput?
    var router: RepositoriesListRoutable
    
    //MARK: Properties
    var repoList: [Repository] = []
    
    //MARK: LifeCycle 
    init(output: RepositoriesListPresenterOutput,
         router: RepositoriesListRoutable) {
        
        self.output = output
        self.router = router
    }
    
    //MARK: RepositoriesListPresenterInput
    func viewDidLoad() {
        output?.displayScreen(title: "Repositories List")
    }
    
    //MARK: TableView Setup
    func numberOfRows() -> Int {
        return repoList.count
    }
    
    func configure(cell: LabelCellOutput, for index: Int) {
        cell.setLabel(value: repoList[index].name)
    }
    
    //MARK: Actions
    func didSelectRowAt(index: Int) {
        router.navigateToRepoDetails(repoList[index])
    }
}


