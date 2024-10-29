//
//  ModuleGammaFactory.swift
//  SimpleMVP
//
//  Created by Alexander on 29.10.2024.
//

import UIKit


final class ModuleGammaFactory {
    
    struct Context {
        var someParam: String
        var someValue: String
    }
    
    func make(context: Context) -> UIViewController {
        let router = ModuleGammaRouter()
        let presenter = ModuleGammaPresenter(
            router: router,
            someParam: context.someParam,
            someValue: context.someValue
        )
        
        let vc = ModuleGammaViewController(presenter: presenter)
        presenter.view = vc
        router.setRootViewController(vc)
        
        return vc
    }
}
