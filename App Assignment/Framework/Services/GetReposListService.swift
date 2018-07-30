//
//  GetReposListService.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

struct GetReposListService: APIResource {
    
    
    var urlString: String{
        return "https://api.github.com/users/romannurik/repos"
    }
    
    func makeModel(from json: AnyObject) -> [Repository] {
        var repositories: [Repository] = []
        let repoArray = json as? [JSONDictionary] ?? []
        
        for repo in repoArray{
            var repository = Repository()
            repository.name = repo["name"] as? String ?? ""
            repository.forksCount = repo["forks_count"] as? Int ?? 0
            repository.watchersCount = repo["watchers_count"] as? Int ?? 0
            repository.contributersURL = repo["contributors_url"] as? String ?? ""
            
            repositories.append(repository)
        }
        
        return repositories
    }
}
