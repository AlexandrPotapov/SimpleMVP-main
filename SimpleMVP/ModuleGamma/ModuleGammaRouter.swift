//
//  ModuleGammaRouter.swift
//  SimpleMVP
//
//  Created by Alexander on 29.10.2024.
//

import UIKit

protocol ModuleGammaRouterProtocol {
    func setRootViewController(_ root: UIViewController)
}


final class ModuleGammaRouter: ModuleGammaRouterProtocol {
    
    weak var root: UIViewController?
    
    func setRootViewController(_ root: UIViewController) {
        self.root = root
    }
}
