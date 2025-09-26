//
//  
//  DetailModelProtocols.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import UIKit

protocol DetailModelViewProtocol: AnyObject {
	var viewPresenter: DetailModelPresenterProtocol? { get set }
    func setDataCitys(citys: [WeatherData])
}

protocol DetailModelPresenterProtocol: AnyObject {
    var view:DetailModelViewProtocol? { get set }
    var interactor:DetailModelInteractorProtocol? { get set }
    var router:DetailModelRouterProtocol? { get set }
    func getDataCitys()
}

protocol DetailModelInteractorProtocol: AnyObject {
    var presenter:DetailModelPresenterProtocol? { get set }
    func fetchWeatherForRandomCities(completion: @escaping ([WeatherData]) -> Void)
}

protocol DetailModelRouterProtocol: AnyObject {
    var view: DetailModelViewProtocol? { get set }
}
