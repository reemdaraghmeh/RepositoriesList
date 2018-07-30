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
    func numberOfSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func configure(cell: LabelCellOutput, for index: Int)
    func titleForHeaderAt(section: Int) -> String
    
}

protocol RepositoryDetailsPresenterOutput {
    func reloadData()
}

class RepositoryDetailsPresenter:  RepositoryDetailsPresenterInput {
    
    //MARK: Injections
    private var output: RepositoryDetailsPresenterOutput?
    var router: RepositoryDetailsRoutable
    var repository: Repository
    let headerTitles = ["Repository Name", "Number Of Forks", "Number Of Watchers", "Contributors"]
    
    //MARK: LifeCycle 
    init(output: RepositoryDetailsPresenterOutput,
         router: RepositoryDetailsRoutable,
         repository: Repository) {
        
        self.output = output
        self.router = router
        self.repository = repository
    }
    
    //MARK: RepositoryDetailsPresenterInput
    func viewDidLoad() {

    }
    
    //MARK: TableView Configurations
    func numberOfSections() -> Int {
        return 4
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return 1
    }
    
    func configure(cell: LabelCellOutput, for index: Int) {
        cell.setSelectionNone()
        if index == 0{
            cell.setLabel(value: repository.name)
        }else if index == 1{
            cell.setLabel(value: String(repository.forksCount))
        }else if index == 2{
            cell.setLabel(value: String(repository.watchersCount))
        }
    }
    
    func titleForHeaderAt(section: Int) -> String {
        return headerTitles[section]
    }
}


