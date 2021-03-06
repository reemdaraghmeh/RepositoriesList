//
//  APIClient.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol APIClient {
    
    func request<Resource: APIResource>(resource: Resource, completionHandler: @escaping (Result<Resource.ResponseModel>) -> Void)
    
    func downloadImageFrom(urlString: String, completionHandler: @escaping (UIImage) -> Void)
}

class APIClientImplementation: APIClient {

    
    func request<Resource: APIResource>(resource: Resource, completionHandler: @escaping (Result<Resource.ResponseModel>) -> Void)  {
                
        Alamofire.request(resource.urlString)
            .responseJSON { response in

                guard response.result.error == nil else {

                    print(response.result.error!)
                    completionHandler(Result.failure(response.result.error!))
                    return
                }
                
                guard (response.result.value as? AnyObject) != nil else {
                    print("didn't get object as JSON from API")
                    if let error = response.result.error {
                        completionHandler(Result.failure(error))
                    }
                    return
                }
                
                let responseModel = resource.makeModel(from: response.result.value as AnyObject)
                completionHandler(Result.success(responseModel))
                
        }

    }

    
    func downloadImageFrom(urlString: String, completionHandler: @escaping (UIImage) -> Void){
        
        Alamofire.request(urlString).responseImage { response in
            
            if let image = response.result.value {
                completionHandler(image)
            }else{
                let defaultImage = UIImage(named: "avatar")
                completionHandler(defaultImage!)
            }
        }
    }
}

