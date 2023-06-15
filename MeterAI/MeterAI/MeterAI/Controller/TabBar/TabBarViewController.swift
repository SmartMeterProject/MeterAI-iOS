//
//  TabBarViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 28.01.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedIndex = 1
        self.tabBar.barTintColor = .baseTintColor
        self.tabBar.backgroundColor = .baseTintColor
        
    }


}
