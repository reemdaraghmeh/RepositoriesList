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
        
        Alamofire.request(url)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    completionHandler(Result.failure(response.result.error!))
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard (response.result.value as? AnyObject) != nil else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        completionHandler(Result.failure(error))
                    }
                    return
                }
                
                let responseModel = resource.makeModel(from: response.result.value as AnyObject)
                completionHandler(Result.success(responseModel))
                
        }
        
       
//        Alamofire
//            .request(url,
//                     method: .get,
//                     parameters: resource.parameters,
//                     encoding: JSONEncoding.default,
//                     headers: nil)
//            .validate()
//            .responseJSON { response in
//
//                guard response.result.isSuccess else {
//
//                    if let error = response.error {
//
//                        print("Alamofire Error: \(error.localizedDescription)")
//                        completionHandler(Result.failure(error))
//                    }
//                    return
//                }
//
//                if let jsonDictionary = response.result.value as? JSONDictionary {
//
//                    print("Response: \(jsonDictionary as AnyObject)")
//
//                    let responseModel = resource.makeModel(from: jsonDictionary)
//
//                    completionHandler(Result.success(responseModel))
//                }
//
//        }
    }

}

