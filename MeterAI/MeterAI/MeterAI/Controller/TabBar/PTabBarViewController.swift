//
//  PTabBarViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import UIKit

class PTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }


    init () {
        super.init(nibName: nil, bundle: nil)
        setupVCs()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func configure(){
        UITabBar.appearance().barTintColor = .baseColor
        UITabBar.appearance().selectedImageTintColor = .red

        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = .baseColor
        setupVCs()
    }
    
    
    private func setupVCs() {
          viewControllers = [

            createNavController(for: UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsVC"), title: NSLocalizedString("Home", comment: ""), item : UITabBarItem(title: "Home", image: UIImage(named: "iconHomeDefault"), selectedImage: UIImage(named: "iconHomeDefault"))),
            createNavController(for: UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC"), title: NSLocalizedString("Home", comment: ""), item : UITabBarItem(title: "Home", image: UIImage(named: "iconHomeDefault"), selectedImage: UIImage(named: "iconHomeDefault"))),
            createNavController(for: UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyStaticsVC"), title: NSLocalizedString("Home", comment: ""), item : UITabBarItem(title: "Home", image: UIImage(named: "iconHomeDefault"), selectedImage: UIImage(named: "iconHomeDefault"))),



          ]
      }


    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String, item : UITabBarItem) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem = item
         // navController.configureNavigationBar()
          rootViewController.navigationItem.title = title
          return navController
      }

}
