//
//  
//  DetailModelViewController.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 2/03/25.
//
//

import UIKit

class DetailModelViewController: UIViewController {

    var viewPresenter: DetailModelPresenterProtocol?
    var rootView: DetailModelView?
    // MARK: - View - Initialization
    required init(presenter: DetailModelPresenterProtocol) {
        self.viewPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        viewPresenter?.getDataCitys()
    }
	
	// MARK: - View - Private Methods
    func customizeUI() {
        rootView = DetailModelView()
        if let rootView = rootView {
            view.addSubview(rootView)
        }
        view.backgroundColor = .systemBrown
        self.title = "Clima en ciudades"
        let buttonBack = UIBarButtonItem(title: "Volver", style: .plain, target: self, action: #selector(backAction))
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = buttonBack
        contrainstDetail()
        // Call the Config func from rootView & fill the data
    }
    func contrainstDetail() {
        rootView?.anchor(top: view.safeAreaLayoutGuide.topAnchor,leading: view.leadingAnchor,trailing: view.trailingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - View - Public Methods (Through Protocol)
extension DetailModelViewController: DetailModelViewProtocol {
    func setDataCitys(citys: [WeatherData]) {
        rootView?.configView(citysData: citys)
        
    }
    
}
