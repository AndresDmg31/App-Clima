//
//  
//  DetailModelPresenter.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import UIKit

class DetailModelPresenter: DetailModelPresenterProtocol {	
    var view: DetailModelViewProtocol?
    var interactor: DetailModelInteractorProtocol?
    var router: DetailModelRouterProtocol?

    init(interactor: DetailModelInteractorProtocol, router:DetailModelRouterProtocol) {
        self.router = router
        self.interactor = interactor
    }

	// MARK: - Presenter - Private Methods
}

// MARK: - Presenter - Public Methods (Through Protocol)
extension DetailModelPresenter {
    
    func getDataCitys(){
        interactor?.fetchWeatherForRandomCities { data in
            self.view?.setDataCitys(citys: data)
        }
    }

    // MARK: - Presenter - Lifecycle Methods
    // func viewDidLoad() { }
    // func viewWillAppear() { }
    // func viewDidAppear() { }
    // func viewWillDisappear() { }
    
}
