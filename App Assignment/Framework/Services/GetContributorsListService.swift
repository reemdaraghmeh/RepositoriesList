//
//  GetContributorsListService.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

struct GetContributorsListService: APIResource {
    
    let contributorURL: String
    
    var urlString: String{
        return contributorURL
    }
    
    func makeModel(from json: AnyObject) -> [Contributor] {
        var contributors: [Contributor] = []
        let jsonArray = json as? [JSONDictionary] ?? []
        for contributorValue in jsonArray{
            var contributor = Contributor()
            contributor.name = contributorValue["login"] as? String ?? ""
            contributor.imageURLString = contributorValue["avatar_url"] as? String ?? ""
            contributors.append(contributor)
        }
        return contributors
    }
}
