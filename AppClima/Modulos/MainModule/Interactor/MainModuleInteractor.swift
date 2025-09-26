//
//  
//  MainModuleInteractor.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit
import Alamofire
import Foundation

class MainModuleInteractor: MainModuleInteractorProtocol {
    let apiKey = "a32b20a98569c27b51ff877d0836913b"

    var presenter: MainModulePresenterProtocol?
	// MARK: - Interactor - Private Methods
}

// MARK: - Interactor - Public Methods (Through Protocol)
extension MainModuleInteractor {
    func getData(city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let json = try JSONDecoder().decode(WeatherData.self, from: data)
                            print(json) // Muestra la respuesta en JSON
                            // Extraer solo los datos necesarios
                                        let cityName = json.name ?? "Desconocido"
                                        let temperature = Float(json.main?.temp ?? 0)
                                        let tempMax = Float(json.main?.tempMax ?? 0)
                                        let tempMin = Float(json.main?.tempMin ?? 0)
                                        let humidity = json.main?.humidity ?? 0
                                        
                                        // Llamar al Presenter para enviar los datos a la View
                                        DispatchQueue.main.async {
                                            self.presenter?.setDataClima(
                                                city: cityName,
                                                temperature: Float(temperature),
                                                temperatureMax: Float(tempMax),
                                                temperatureMin: Float(tempMin),
                                                humidity: humidity
                                            )
                                        }
                        } catch {
                            print("Error al parsear JSON: \(error)")
                        }
                    }
                }
                task.resume()
        }
    }
}

