//
//  APIClient.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient {
    
    func request<Resource: APIResource>(resource: Resource, completionHandler: @escaping (Result<Resource.ResponseModel>) -> Void)
}

class APIClientImplementation: APIClient {

    
    func request<Resource: APIResource>(resource: Resource, completionHandler: @escaping (Result<Resource.ResponseModel>) -> Void)  {
        
        let url = "\(resource.urlString)\(resource.methodName)"
        
        Alamofire
            .request(url,
                     method: .get,
                     parameters: resource.parameters,
                     encoding: JSONEncoding.default,
                     headers: nil)
            .validate()
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    
                    if let error = response.error {
                        
                        print("Alamofire Error: \(error.localizedDescription)")
                        completionHandler(Result.failure(error))
                    }
                    return
                }
                
                if let jsonDictionary = response.result.value as? JSONDictionary {
                    
                    print("Response: \(jsonDictionary as AnyObject)")

                    let responseModel = resource.makeModel(from: jsonDictionary)
                    
                    completionHandler(Result.success(responseModel))
                }
                
        }
    }

}

