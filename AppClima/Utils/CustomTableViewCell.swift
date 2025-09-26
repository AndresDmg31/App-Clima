//
//  CustomTableViewCell.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // Label para la ciudad
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Label para la temperatura
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label para la temperatura maxima
    let temperatureLabelMax: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label para la temperatura minima
    let temperatureLabelMin: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Agregar los componentes a la celda
        self.addSubview(cityLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(temperatureLabelMax)
        self.addSubview(temperatureLabelMin)
        contrainsCell()
                
    }
    
    func contrainsCell(){
        cityLabel.anchor(top: self.topAnchor,paddingTop: 20, leading: self.leadingAnchor,paddingLeading: 20,trailing: self.trailingAnchor,paddingTrailing: 20)
        temperatureLabel.anchor(top: cityLabel.bottomAnchor,paddingTop: 20, leading: self.leadingAnchor,paddingLeading: 20,trailing: self.trailingAnchor,paddingTrailing: 20)
        temperatureLabelMax.anchor(top: temperatureLabel.bottomAnchor,paddingTop: 10, leading: self.leadingAnchor,paddingLeading: 20,trailing: self.trailingAnchor,paddingTrailing: 20)
        temperatureLabelMin.anchor(top: temperatureLabelMax.bottomAnchor,paddingTop: 10, leading: self.leadingAnchor,paddingLeading: 20,trailing: self.trailingAnchor,paddingTrailing: 20,bottom: self.bottomAnchor, paddingBottom: 20)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Función para actualizar la celda con datos
    func configure(city: String, temperature: String, temperatureMax: String, temperatureMin: String) {
        cityLabel.text = "Ciudad: " + city
        temperatureLabel.text = "Temperatura: " + "\(temperature)°C"
        temperatureLabelMax.text = "Temperatura Maxima: " + "\(temperatureMax)°C"
        temperatureLabelMin.text = "Temperatura Minima: " + "\(temperatureMin)°C"
    }
}

