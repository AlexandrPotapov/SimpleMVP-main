//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

enum ConfirmationResult {
    case confirmed
    case canceled
}

final class AlertModuleFactory {
    
    func make(title: String, message: String) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alertViewController.addAction(action)
        
        return alertViewController
    }
    
    func make(title: String, message: String, okActionTitle: String, cancelActionTitle: String, completion: @escaping (ConfirmationResult) -> Void) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: okActionTitle,
            style: .default,
            handler: { _ in completion(.confirmed) }
        )
        
        let cancelAction = UIAlertAction(
            title: cancelActionTitle,
            style: .cancel,
            handler: { _ in completion(.canceled) }
        )
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        return alertViewController
    }
    
}
