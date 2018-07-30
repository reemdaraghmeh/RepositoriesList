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
    func reloadData()
}

class RepositoriesListPresenter:  RepositoriesListPresenterInput {
    
    //MARK: Injections
    private var output: RepositoriesListPresenterOutput?
    var router: RepositoriesListRoutable
    
    //MARK: Properties
    var repoList: [Repository] = []
    let gateway: ReposGateway
    
    //MARK: LifeCycle 
    init(output: RepositoriesListPresenterOutput,
         router: RepositoriesListRoutable,
         gateway: ReposGateway) {
        
        self.output = output
        self.router = router
        self.gateway = gateway
    }
    
    //MARK: RepositoriesListPresenterInput
    func viewDidLoad() {
        output?.displayScreen(title: "Repositories List")
        getRepoList()
    }
    
    //MARK: TableView Setup
    func numberOfRows() -> Int {
        return repoList.count
    }
    
    func configure(cell: LabelCellOutput, for index: Int) {
        cell.setLabel(value: repoList[index].name)
        cell.setAccessoryDisclosureIndicator()
    }
    
    //MARK: Actions
    func didSelectRowAt(index: Int) {
        router.navigateToRepoDetails(repoList[index])
    }
    
    //MARK: API
    func getRepoList(){
        
        let service = GetReposListService()
        gateway.getReposList(service: service) { [weak self] result in
            
            switch result{
                
            case .success(let value):
                self?.repoList = value
                self?.output?.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


