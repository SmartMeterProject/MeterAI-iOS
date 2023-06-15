//
//  StatisticHistoryViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import UIKit

class StatisticHistoryViewController: UIViewController {
    
    private lazy var selectOptionView : SelectOptionView = {
       let sov = SelectOptionView()
        sov.translatesAutoresizingMaskIntoConstraints = false
        return sov
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .baseColor
        configureNavigationBar()
        configureLayout()
    }
    
    private func configureLayout(){
        view.addSubview(selectOptionView)
        
        NSLayoutConstraint.activate([
            selectOptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            selectOptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectOptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            selectOptionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureNavigationBar(){
        title = "Geçmiş Raporlarım"
        navigationController?.configureNavigationForBase()
    }
    
}
