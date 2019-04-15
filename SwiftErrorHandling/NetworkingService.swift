//
//  NetworkingService.swift
//  SwiftErrorHandling
//
//  Created by Victor Lee on 15/4/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

enum NetworkingError: String, Error {
    case invalidRequest = "Hey you made an invalid request..."
    case invalidResponse = "Hello it seems your response was invalid..."
}

class NetworkingService {
    
    func makeRequest(completion: @escaping (Result<String, NetworkingError>) -> Void) {
        
        let isValidRequest = true
        
        if isValidRequest {
            
            let isValidResponse = false
            
            if isValidResponse {
                completion(.success("Alright!! Request came back fine!"))
            } else {
                completion(.failure(.invalidResponse))
            }
            
        } else {
            completion(.failure(.invalidRequest))
        }
    }
}

extension NetworkingError: LocalizedError {
    
    var errorDescription: String? {
        return NSLocalizedString(rawValue, comment: "")
    }
}
