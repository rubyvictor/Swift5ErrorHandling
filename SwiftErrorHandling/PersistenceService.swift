//
//  PersistenceService.swift
//  SwiftErrorHandling
//
//  Created by Victor Lee on 15/4/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

class PersistenceService {
    
    func save() throws {
        
        //MARK: - flags for scenarios
        
        let isNewTopic = true
        let isValidContext = true
        let canWriteToDisk = false
        
        guard isNewTopic else { throw NSError(domain: "OH dear mie..", code: 44444, userInfo: nil) }
        
        guard isValidContext else { throw PersistenceError.invalidContext }
        
        guard canWriteToDisk else { throw PersistenceError.failedToWriteToDisk }
        
        print("We have saved successfully!")
        
    }
}

enum PersistenceError: String, Error {
    case invalidContext
    case failedToWriteToDisk
}
