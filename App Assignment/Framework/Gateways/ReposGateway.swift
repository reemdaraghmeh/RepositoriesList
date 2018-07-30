//
//  ReposGateway.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import UIKit

protocol ReposGateway{
    func getReposList(service: GetReposListService, completionHandler: @escaping (Result<[Repository]>) -> Void)
    
    func getContributorsList(service: GetContributorsListService, completionHandler: @escaping (Result<[Contributor]>) -> Void)
    
    func downloadImageFrom(urlString: String, completionHandler: @escaping (UIImage) -> Void)
}


class ReposGatewayImplementation: ReposGateway{
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient  = apiClient
    }
    
    func getReposList(service: GetReposListService, completionHandler: @escaping (Result<[Repository]>) -> Void) {
        
        apiClient.request(resource: service, completionHandler: completionHandler)
    }
    
    func getContributorsList(service: GetContributorsListService, completionHandler: @escaping (Result<[Contributor]>) -> Void) {
        apiClient.request(resource: service, completionHandler: completionHandler)
    }
    
    func downloadImageFrom(urlString: String, completionHandler: @escaping (UIImage) -> Void){
        apiClient.downloadImageFrom(urlString: urlString, completionHandler: completionHandler)
    }
}
