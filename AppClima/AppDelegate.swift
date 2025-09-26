//
//  AppDelegate.swift
//  AppClima
//
//  Created by Andres Martinez gonzalez on 1/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Crear NavigationController
        let navigationController = UINavigationController()
        
        // Crear el módulo principal pasándole el navigationController
        let rootViewController = MainModule.build(navigation: navigationController)
        
        // Asignar el rootViewController al navigationController
        navigationController.viewControllers = [rootViewController]
        
        // Configurar la ventana principal
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }}
