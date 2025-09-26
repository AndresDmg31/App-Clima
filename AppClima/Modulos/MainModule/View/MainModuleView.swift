//
//  
//  MainModuleView.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//
//

import UIKit

class MainModuleView: UIView {
    
    var tapFinish: ((CitySelect) -> Void)?
    var tapNextController: (()-> Void)?
    
    var stackView: UIStackView = {
        let stackViiew = UIStackView()
        stackViiew.axis = .vertical
        stackViiew.spacing = 10
        stackViiew.alignment = .center
    
        return stackViiew
    }()
    
    var stackCity: UIStackView = {
        let stackCity = UIStackView()
        stackCity.axis = .horizontal
        stackCity.distribution = .fillEqually
        stackCity.backgroundColor = .clear
        
        return stackCity
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.text = "Selecciona tu ciudad"
        title.font = .systemFont(ofSize: 40, weight: .bold)
        title.textColor = .black
        return title
    }()
    
    lazy var city: UILabel = {
        let city = UILabel()
        city.text = "Ciudad:"
        city.textColor = .black
        return city
    }()
    
    lazy var temperature: UILabel = {
        let temperature = UILabel()
        temperature.text = "Temperatura:"
        temperature.textColor = .black
        return temperature
    }()
    
    lazy var temperatureMax: UILabel = {
        let temperatureMax = UILabel()
        temperatureMax.text = "Temperatura Maxima:"
        temperatureMax.textColor = .black
        return temperatureMax
    }()
    
    lazy var temperatureMin: UILabel = {
        let temperatureMin = UILabel()
        temperatureMin.text = "Temperatura Minima:"
        temperatureMin.textColor = .black
        return temperatureMin
    }()
    
    lazy var humidity: UILabel = {
        let humidity = UILabel()
        humidity.text = "Humedad:"
        humidity.textColor = .black
        return humidity
    }()
    
    lazy var buttonBogota: UIButton = {
        let button = UIButton()
        button.setTitle("Bogota", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(self.tapButtonBgta), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonNy: UIButton = {
        let button = UIButton()
        button.setTitle("New York", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(self.tapButtonNy), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonMx: UIButton = {
        let button = UIButton()
        button.setTitle("Mexico", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(self.tapButtonMx), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonAdd: UIButton = {
        let button = UIButton()
        button.setTitle("Ver mas ciudades", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.textColor = .black
        button.addTarget(self, action: #selector(self.tapButtonAdd), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        self.addViews()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
	//  MARK: - View - Initialization
    
    func addViews() {
        self.addSubview(title)
        self.addSubview(stackCity)
        stackCity.addArrangedSubview(buttonBogota)
        stackCity.addArrangedSubview(buttonNy)
        stackCity.addArrangedSubview(buttonMx)
        self.addSubview(stackView)
        stackView.addArrangedSubview(city)
        stackView.addArrangedSubview(temperature)
        stackView.addArrangedSubview(temperatureMax)
        stackView.addArrangedSubview(temperatureMin)
        stackView.addArrangedSubview(humidity)
        self.addSubview(buttonAdd)
        setConstrains()
    }
    
    func setConstrains() {
        title.anchor(top: self.topAnchor,leading: self.leadingAnchor,paddingLeading: 10,trailing: self.trailingAnchor,paddingTrailing: 10,height: 40)
        stackCity.anchor(top: title.bottomAnchor,paddingTop: 20,leading: self.leadingAnchor,paddingLeading: 10,trailing: self.trailingAnchor,paddingTrailing: 10,height: 50)
        stackView.anchor(top: stackCity.bottomAnchor,paddingTop: 20,leading: self.leadingAnchor,paddingLeading: 50,trailing: self.trailingAnchor,paddingTrailing: 50,height: 150)
        buttonAdd.anchor(leading: self.leadingAnchor,paddingLeading: 10,trailing: self.trailingAnchor,paddingTrailing: 10,bottom: self.bottomAnchor,height: 40)
        
    }
    
    func configView(city: String, temperature: Float, temperatureMax: Float, temperatureMin: Float, humidity: Int) {
        self.city.text = "Ciudad: \(city)"
        self.temperature.text = "Temperatura: \(temperature)°C"
        self.temperatureMax.text = "Temperatura Maxima: \(temperatureMax)°C"
        self.temperatureMin.text = "Temperatura Minima: \(temperatureMin)°C"
        self.humidity.text = "Humedad: \(humidity)ω"
        //city.text = newTitle
        // fill & config Self view
    }
    
    @objc func tapButtonBgta() {
        tapFinish?(.bogota)
    }
    @objc func tapButtonNy() {
        tapFinish?(.ny)
    }
    @objc func tapButtonMx() {
        tapFinish?(.cdxm)
    }
    @objc func tapButtonAdd() {
        tapNextController?()
    }
}

