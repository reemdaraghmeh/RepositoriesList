//
//  APIResource.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

protocol APIResource {
    
    associatedtype ResponseModel
    
    var methodName: String { get }
    
    var parameters: JSONDictionary { get }
    
    func makeModel(from json: JSONDictionary) -> ResponseModel
    
}

extension APIResource {
    
    var urlString: String {
        return "https://api.github.com/users/romannurik/"//repos
    }
    
    var parameters: JSONDictionary {
        return [:]
    }
}

enum Result<Value> {
    
    case success(Value)
    
    case failure(Error)
    
}
