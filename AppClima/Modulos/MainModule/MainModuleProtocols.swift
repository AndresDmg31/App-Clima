//
//  
//  MainModuleProtocols.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit

protocol MainModuleViewProtocol: AnyObject {
	var viewPresenter: MainModulePresenterProtocol? { get set }
    func setDataClima(city: String, temperature: Float, temperatureMax: Float, temperatureMin: Float, humidity: Int)
}

protocol MainModulePresenterProtocol: AnyObject {
    var view:MainModuleViewProtocol? { get set }
    var interactor:MainModuleInteractorProtocol? { get set }
    var router:MainModuleRouterProtocol? { get set }
    
    func getWeatherData (city: CitySelect)
    func setDataClima(city: String, temperature: Float, temperatureMax: Float, temperatureMin: Float, humidity: Int)

    func nextViewController()
}

protocol MainModuleInteractorProtocol: AnyObject {
    var presenter:MainModulePresenterProtocol? { get set }
    
    func getData (city: String)
}

protocol MainModuleRouterProtocol: AnyObject {
    var navigation: UINavigationController? { get set }
    func nextView()
}
