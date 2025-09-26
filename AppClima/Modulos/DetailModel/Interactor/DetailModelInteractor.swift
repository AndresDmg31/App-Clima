//
//
//  DetailModelInteractor.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import UIKit
import Alamofire

class DetailModelInteractor: DetailModelInteractorProtocol {
    var presenter: DetailModelPresenterProtocol?
    let apiKey = "a32b20a98569c27b51ff877d0836913b"
    // Lista de ciudades disponibles
    let allCities = ["Bogota", "New York", "Mexico City", "London", "Tokyo", "Paris", "Berlin", "Madrid", "Rome", "Buenos Aires"]
    // MARK: - Interactor - Private Methods
}

// MARK: - Interactor - Public Methods (Through Protocol)
extension DetailModelInteractor {
    
    func fetchWeatherForRandomCities(completion: @escaping ([WeatherData]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var weatherResults: [WeatherData] = []
        
        for city in allCities {
            dispatchGroup.enter()
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
            
            guard let url = URL(string: urlString) else {
                dispatchGroup.leave()
                continue
            }
            
            AF.request(url,method: .get).validate().responseDecodable(of: WeatherData.self) { response in
                defer { dispatchGroup.leave() }
                switch response.result {
                case .success(let weatherData):
                    weatherResults.append(weatherData)
                case .failure(let error):
                    print("Error obteniendo clima para \(city): \(error.localizedDescription)")
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(weatherResults)
        }
    }
}
