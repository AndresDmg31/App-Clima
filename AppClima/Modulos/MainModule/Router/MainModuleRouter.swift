//
//  
//  MainModuleRouter.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit

class MainModuleRouter: MainModuleRouterProtocol {
    var navigation: UINavigationController?
	// MARK: - Router - Private Methods
}

// MARK: - Router - Public Methods (Through Protocol)
extension MainModuleRouter {
    func nextView() {
        
        let nextVc = DetailModel.build()
        navigation?.pushViewController(nextVc, animated: true)
    }
}
