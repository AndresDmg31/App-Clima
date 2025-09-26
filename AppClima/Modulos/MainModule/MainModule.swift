//
//  
//  MainModule.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import Foundation
import UIKit

class MainModule {
    
    /// <#Description#>
    /// - Returns: `MainModuleViewController` Object
    static func build(navigation: UINavigationController) -> UIViewController {
        let interactor: MainModuleInteractorProtocol = MainModuleInteractor()
        let router: MainModuleRouterProtocol = MainModuleRouter()
        let presenter: MainModulePresenterProtocol = MainModulePresenter(interactor: interactor, router: router)
        let view = MainModuleViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        router.navigation = navigation
        
        return view
    }
}
