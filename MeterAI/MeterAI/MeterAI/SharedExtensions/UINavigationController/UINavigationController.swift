//
//  UINavigationController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 28.01.2023.
//

import UIKit

extension UINavigationController{
    
    func configureNavigationForBase() {
        navigationBar.tintColor = .white
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.backgroundColor = .baseTintColor
            navBarAppearance.backgroundEffect = nil
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 22)]
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.standardAppearance = navBarAppearance
        }
    }
}
