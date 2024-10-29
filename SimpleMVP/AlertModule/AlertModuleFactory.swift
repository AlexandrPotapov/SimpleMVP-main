//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

final class AlertModuleFactory {
    
    func make(title: String, message: String, withCancellAction: Bool = false, complition: (() -> Void)? = nil ) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                complition?() // Вызов замыкания после нажатия "Ok"
            }
        )
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        
        
        alertViewController.addAction(action)
        
        if withCancellAction {
            alertViewController.addAction(cancelAction)
        }
        
        return alertViewController
    }
}
