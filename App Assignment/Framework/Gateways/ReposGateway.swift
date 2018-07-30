//
//  ReposGateway.swift
//  App Assignment
//
//  Created by Reem Daraghmeh on 7/30/18.
//  Copyright © 2018 Daraghmeh. All rights reserved.
//

import Foundation

protocol ReposGateway{
    func getReposList(service: GetReposListService, completionHandler: @escaping (Result<[Repository]>) -> Void)
}


class ReposGatewayImplementation: ReposGateway{
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient  = apiClient
    }
    
    func getReposList(service: GetReposListService, completionHandler: @escaping (Result<[Repository]>) -> Void) {
        
        apiClient.request(resource: service, completionHandler: completionHandler)
    }
}
