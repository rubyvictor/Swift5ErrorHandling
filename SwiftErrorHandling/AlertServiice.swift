//
//  AlertServiice.swift
//  SwiftErrorHandling
//
//  Created by Victor Lee on 15/4/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class AlertService {
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
