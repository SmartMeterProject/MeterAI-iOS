//
//  NewsDetailViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import UIKit
import StoreKit

class NewsDetailViewController: UIViewController {
    
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isDirectionalLockEnabled = true
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
    private lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 18.0
        iv.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return iv
    }()
    
    private lazy var arrowImageView : UIImageView = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedBack))
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.addGestureRecognizer(recognizer)
        iv.isUserInteractionEnabled = true
       return iv
    }()
    
    @objc func tappedShare(){
        var messageBody = descriptionLabel.text

  
        let attributedString = NSMutableAttributedString(string: "Made with MeterAI app")
        let url = URL(string: "https://meter.ai")!
        attributedString.setAttributes([.link: url], range: NSMakeRange(0, 19))
        
        let activityVC = UIActivityViewController(activityItems: [messageBody ?? "",attributedString], applicationActivities: nil)
        let excludeActivities: [UIActivity.ActivityType] = [.airDrop, .print, .assignToContact, .saveToCameraRoll, .addToReadingList, .postToFlickr, .postToVimeo]
        activityVC.excludedActivityTypes = excludeActivities
        present(activityVC, animated: true)
    }
    
    @objc func tappedBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private lazy var shareImageView : UIImageView = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedShare))
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "arrowshape.turn.up.right.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.addGestureRecognizer(recognizer)
        iv.isUserInteractionEnabled = true
       return iv
    }()
    
    private lazy var customNavBarView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configure(){
        configureLayout()
        configureNavBar()
    }
    
    private func configureNavBar(){
      
    }
    
    private func configureLayout(){
        
        view.backgroundColor = .baseColor
        
        containerView.backgroundColor = .baseColor
        
        view.addSubview(containerView)
        containerView.addSubview(scrollView)
        
        scrollView.addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(customNavBarView)
        customNavBarView.addSubview(arrowImageView)
        customNavBarView.addSubview(shareImageView)

        mainView.addSubview(titleLabel)
        mainView.addSubview(descriptionLabel)
        
        view.bringSubviewToFront(customNavBarView)
        
        var statusBarHeight: CGFloat = 0

       
        if let window = UIApplication.shared.windows.first {
            statusBarHeight = window.safeAreaInsets.top
        }
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view .leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            customNavBarView.topAnchor.constraint(equalTo: mainView.topAnchor),
            customNavBarView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            customNavBarView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            arrowImageView.heightAnchor.constraint(equalToConstant: 32),
            arrowImageView.widthAnchor.constraint(equalToConstant: 32),
            arrowImageView.leadingAnchor.constraint(equalTo: customNavBarView.leadingAnchor, constant: 24),
            arrowImageView.topAnchor.constraint(equalTo: customNavBarView.topAnchor, constant: 24),
            arrowImageView.bottomAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: -24),
            
            shareImageView.heightAnchor.constraint(equalToConstant: 32),
            shareImageView.widthAnchor.constraint(equalToConstant: 32),
            shareImageView.trailingAnchor.constraint(equalTo: customNavBarView.trailingAnchor, constant: -24),
            shareImageView.topAnchor.constraint(equalTo: customNavBarView.topAnchor, constant: 24),
            shareImageView.bottomAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: -24),
            
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),

            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
           
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            descriptionLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        
            
        ])
    }
    
    func configureContent(news : NewNews){
        titleLabel.text = news.title
        descriptionLabel.text = news.content
        imageView.setNetworkImage(urlStr: news.contentImagePath)
    }
    

}
