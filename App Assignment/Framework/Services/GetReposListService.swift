//
//  GetReposListService.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

struct GetReposListService: APIResource {
    
    
    var methodName: String{
        return "repos"
    }
    
    
    func makeModel(from json: JSONDictionary) -> [Repository] {
        var repositories: [Repository] = []
        
        return repositories
    }
}
