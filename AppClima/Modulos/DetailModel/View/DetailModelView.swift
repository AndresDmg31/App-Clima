//
//
//  DetailModelView.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import UIKit

class DetailModelView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var citysData: [WeatherData]?
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        contrainstDetail()
        
        // add custom Views to Self.
    }
    
    func contrainstDetail() {
        tableView.anchor(top: topAnchor,leading: leadingAnchor,trailing: trailingAnchor,bottom: bottomAnchor)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citysData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        guard let data = citysData?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(city: data.name ?? "", temperature: "\(data.main?.temp ?? 0)", temperatureMax: "\(data.main?.tempMax ?? 0)", temperatureMin: "\(data.main?.tempMin ?? 0)")
        return cell
    }
    
    func configView(citysData: [WeatherData]) {
        self.citysData = citysData
        tableView.reloadData()
        
        // fill & config Self view
    }
}

