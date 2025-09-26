//
//  
//  DetailModel.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import Foundation
import UIKit

class DetailModel {
    
    /// <#Description#>
    /// - Returns: `DetailModelViewController` Object
    static func build() -> UIViewController {
        
        let interactor: DetailModelInteractorProtocol = DetailModelInteractor()
        let router: DetailModelRouterProtocol = DetailModelRouter()
        let presenter: DetailModelPresenterProtocol = DetailModelPresenter(interactor: interactor, router: router)
        let view = DetailModelViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
