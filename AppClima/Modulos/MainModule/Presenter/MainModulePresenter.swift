//
//  
//  MainModulePresenter.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit

class MainModulePresenter: MainModulePresenterProtocol {
    
    var view: MainModuleViewProtocol?
    var interactor: MainModuleInteractorProtocol?
    var router: MainModuleRouterProtocol?

    init(interactor: MainModuleInteractorProtocol, router:MainModuleRouterProtocol) {
        self.router = router
        self.interactor = interactor
    }

	// MARK: - Presenter - Private Methods
}

// MARK: - Presenter - Public Methods (Through Protocol)
extension MainModulePresenter {    
    func getWeatherData (city: CitySelect) {
        var cityName: String = ""
        
        switch city {
        case .bogota:
            cityName = "Bogota"
        case .ny:
            cityName = "New york"
        case .cdxm:
            cityName = "Mexico"
        }
        interactor?.getData(city: cityName)
        print("llamado de datos presenter")
    }
    func nextViewController() {
        router?.nextView()
    }
    func setDataClima(city: String, temperature: Float, temperatureMax: Float, temperatureMin: Float, humidity: Int) {
        view?.setDataClima(city: city, temperature: temperature, temperatureMax: temperatureMax, temperatureMin: temperatureMin, humidity: humidity)
    }
    
    

    // MARK: - Presenter - Lifecycle Methods
    // func viewDidLoad() { }
    // func viewWillAppear() { }
    // func viewDidAppear() { }
    // func viewWillDisappear() { }
    
}
