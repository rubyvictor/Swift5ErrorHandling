//
//  ViewController.swift
//  SwiftErrorHandling
//
//  Created by Victor Lee on 15/4/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let alertService = AlertService()
    let persistenceService = PersistenceService()
    let networkService = NetworkingService()
    

    @IBAction func didTapShut(_ sender: Any) {
        assertionFailure("Fatal error - you're shut!")
    }
    
    @IBAction func didTapOptional(_ sender: Any) {
        let value: Any? = nil
        guard let unwrappedValue = value else {
            let alert = alertService.alert(message: "Add a valid value before continuing...")
            
            present(alert, animated: true)
            
            return
        }
        print("unwrapped value: \(unwrappedValue)")
    }
    
    @IBAction func didTapNetworking(_ sender: Any) {
        networkService.makeRequest { [weak self] (result) in
        
            switch result {
                
            case .success(let message):
                
                guard let alert = self?.alertService.alert(message: message) else { return }
                self?.present(alert, animated: true)
                
            case .failure(let error):
                
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                
                self?.present(alert, animated: true)
                
            }
            
            
            
        }
        
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        
        handleSaveProperly()
    }
    
    
    //MARK: - Not good save
    
    func forcesave() {
        try! persistenceService.save()
    }
    //MARK: - optional save
    
    func attemptSave() {
        try? persistenceService.save()
    }
    
    func handleSaveProperly() {
        
        var alert: UIAlertController?
        
        do {
            
            try persistenceService.save()
            alert = alertService.alert(message: "Hurray - we saved it!")
            
        } catch PersistenceError.invalidContext {
            alert = alertService.alert(message: "There's something wrong with the context.")
        } catch PersistenceError.failedToWriteToDisk {
            alert = alertService.alert(message: "Something went wrong and failed to save to disk.")
        } catch {
            alert = alertService.alert(message: "The SDK didn't work.")
        }
        
        if let unwrappedAlert = alert {
            present(unwrappedAlert, animated: true)
        }
    }

    
}

