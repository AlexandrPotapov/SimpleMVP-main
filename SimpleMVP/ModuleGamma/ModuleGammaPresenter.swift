//
//  ModuleGammaPresenter.swift
//  SimpleMVP
//
//  Created by Alexander on 29.10.2024.
//

import Foundation

protocol ModuleGammaPresenterProtocol {
    var title: String { get }
    func viewDidLoad()
}



final class ModuleGammaPresenter: ModuleGammaPresenterProtocol {
    
    weak var view: ModuleGammaViewProtocol?
    
    private let router: ModuleGammaRouterProtocol
    private let someParam: String
    private let someValue: String
    
    var title: String { "ModuleGamma" }
    
    init(router: ModuleGammaRouterProtocol, someParam: String, someValue: String) {
        self.router = router
        self.someParam = someParam
        self.someValue = someValue
    }
    
    deinit {
        print(">>> ModuleGammaPresenter is deinit")
    }
    
    func viewDidLoad() {
        let model = ModuleGammaView.Model(text: someParam, image: someValue)
        view?.update(model: model)
    }
}
