//
//  MyStatisticsViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import UIKit
import Lottie

class MyStatisticsViewController: UIViewController {
    
    private var animationView: AnimationView?
    
    private var myStatics = [Statistic(title: "Haftalık", type : .weekly), Statistic(title: "Aylık", type: .monthly), Statistic(title: "Yıllık", type: .year)]
    
    private lazy var animationViewContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private func createAnimationView() -> AnimationView? {
        let newAnimationView = AnimationView()
        newAnimationView.contentMode = .scaleAspectFit
        newAnimationView.loopMode = .loop
        newAnimationView.backgroundBehavior = .pauseAndRestore
        newAnimationView.respectAnimationFrameRate = true
        newAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        if let loadingAnimation = Animation.named("findStatisticAnimation", bundle: Bundle.main, subdirectory: nil, animationCache: LRUAnimationCache.sharedCache) {
            newAnimationView.animation =  loadingAnimation
        }
        
        return newAnimationView
    }
    
    private lazy var tableView : UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    private lazy var titleLabel : UILabel = {
       let lbl = UILabel()
       lbl.translatesAutoresizingMaskIntoConstraints = false
       return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        animationView?.play()
    }
    
    private func configure(){
        configureNavigationBar()
        configureLayout()
        configureTableView()
    }
    
    private func configureLayout(){
        view.addSubview(animationViewContainer)
        view.addSubview(tableView)
        animationView = createAnimationView()
        
        if let animationView = animationView {
            animationViewContainer.addSubview(animationView)
            NSLayoutConstraint.activate([
                
                animationViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                animationViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                
                tableView.topAnchor.constraint(equalTo: animationViewContainer.bottomAnchor, constant: 24),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                
                animationView.topAnchor.constraint(equalTo: animationViewContainer.topAnchor),
                animationView.leadingAnchor.constraint(equalTo: animationViewContainer.leadingAnchor),
                animationView.trailingAnchor.constraint(equalTo: animationViewContainer.trailingAnchor),
                animationView.bottomAnchor.constraint(equalTo: animationViewContainer.bottomAnchor),
                animationView.heightAnchor.constraint(equalToConstant: 240),
                
            ])
        }
        
    }
    
    private func configureNavigationBar(){
        title = "Raporlarım"
        navigationController?.configureNavigationForBase()
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "clock.arrow.circlepath")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(tappedHistory))
    }
    
    
    @objc func tappedHistory(){
        let vc = StatisticHistoryViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func configureTableView(){
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = true
        tableView.alwaysBounceVertical = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StatisticsOptionTableViewCell.self, forCellReuseIdentifier: "StatisticsOptionTableViewCell")
    }
    
    private func goToDetailScreen(){
        let vc = StatisticDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MyStatisticsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStatics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsOptionTableViewCell", for: indexPath) as? StatisticsOptionTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.configureAttr(title: myStatics[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailScreen()
    }
    
    
}
