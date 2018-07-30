//
//  RepositoryDetailsPresenter.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright (c) 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol RepositoryDetailsPresenterInput: BasePresenterInput {
    
    var router: RepositoryDetailsRoutable { get }
    func numberOfSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func configure(cell: LabelCellOutput, for index: Int)
    func configure(contributorCell: ContributorCellOutput, index: Int)
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
    var contributors: [Contributor] = []
    let headerTitles = ["Repository Name", "Number Of Forks", "Number Of Watchers", "Contributors"]
    let gateway: ReposGateway
    
    
    //MARK: LifeCycle 
    init(output: RepositoryDetailsPresenterOutput,
         router: RepositoryDetailsRoutable,
         repository: Repository,
         gateway: ReposGateway) {
        
        self.output = output
        self.router = router
        self.repository = repository
        self.gateway = gateway
    }
    
    //MARK: RepositoryDetailsPresenterInput
    func viewDidLoad() {
        getContributorsList()
    }
    
    //MARK: TableView Configurations
    func numberOfSections() -> Int {
        if contributors.count == 0{
            return 3
        }else{
            return 4
        }
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        if section == 3{
            return contributors.count
        }else{
            return 1
        }
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
    
    func configure(contributorCell: ContributorCellOutput, index: Int) {
        contributorCell.set(name: contributors[index].name)
        getContributorImage(contributor: contributors[index]) { (image) in
            contributorCell.set(image: image)
        }
    }
    
    func titleForHeaderAt(section: Int) -> String {
        return headerTitles[section]
    }
    
    //MARK: API
    func getContributorsList(){
        let service = GetContributorsListService(contributorURL: repository.contributersURL)
        gateway.getContributorsList(service: service) { [weak self] result in
            
            switch result{
                
            case .success(let value):
                self?.contributors = value
                self?.output?.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getContributorImage(contributor: Contributor, completionHandler: @escaping (UIImage) -> Void){
        
        gateway.downloadImageFrom(urlString: contributor.imageURLString) { (image) in
            completionHandler(image)
        }
    }
}


