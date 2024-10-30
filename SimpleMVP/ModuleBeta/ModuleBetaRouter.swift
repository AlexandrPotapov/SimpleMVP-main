//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {
    func showSuccess()
    func showError()
    func openModuleGamma(with param: String, value: String)
    func showConformation(completion: @escaping (ConfirmationResult) -> Void)
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
        
    weak var root: UIViewController?
    
    private let alertFactory: AlertModuleFactory
    private let gammaFactory: ModuleGammaFactory

    
    init(alertFactory: AlertModuleFactory, gammaFactory: ModuleGammaFactory) {
        self.alertFactory = alertFactory
        self.gammaFactory = gammaFactory
    }
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    func openModuleGamma(with param: String, value: String) {
        
        let context = ModuleGammaFactory.Context(
            someParam: param,
            someValue: value
        )
        
        let viewController = gammaFactory.make(context: context)
        
        root?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showConformation(completion: @escaping (ConfirmationResult) -> Void) {
        let viewController = AlertModuleFactory().make(
            title: "SimpleMVP",
            message: "Save changes?",
            okActionTitle: "Ok",
            cancelActionTitle: "Cancel",
            completion: completion
        )
        root?.present(viewController, animated: true)
    }
        
    func showSuccess() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save success"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
}
