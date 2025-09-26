//
//  
//  MainModuleViewController.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit

class MainModuleViewController: UIViewController {

    var viewPresenter: MainModulePresenterProtocol?
    var rootView: MainModuleView?
    // MARK: - View - Initialization
    required init(presenter: MainModulePresenterProtocol) {
        self.viewPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        viewPresenter?.getWeatherData(city: .bogota)
    }
	
	// MARK: - View - Private Methods
    func customizeUI() {
        rootView = MainModuleView()
        if let rootView = rootView {
            view.addSubview(rootView)
            setConstrains()
            configClousers()

        }
        view.backgroundColor = .systemBrown

        self.title = "Clima"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black]
        // Call the Config func from rootView & fill the data
    }
    
    private func setConstrains() {
        rootView?.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func configClousers() {
        rootView?.tapFinish = { city in
            self.viewPresenter?.getWeatherData(city: city)
        }
        rootView?.tapNextController = {
            self.viewPresenter?.nextViewController()
        }
    }
}

// MARK: - View - Public Methods (Through Protocol)
extension MainModuleViewController: MainModuleViewProtocol {
    func setDataClima(city: String, temperature: Float, temperatureMax: Float, temperatureMin: Float, humidity: Int) {
        rootView?.configView(city: city, temperature: temperature, temperatureMax: temperatureMax, temperatureMin: temperatureMin, humidity: humidity)
    }
    
}
