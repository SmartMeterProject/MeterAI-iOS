//
//  PriceInfoView.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 28.01.2023.
//

import UIKit

class PriceInfoView: UIView {

    
    private lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "diagonal-arrow")
        iv.backgroundColor = UIColor(red: 101.0/255.0, green: 201.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        iv.layer.cornerRadius = 8.0
        return iv
    }()
    
    private lazy var textContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tüketim miktarı m3"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "132.000"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    
    func configureTexts(title: String, subTitle : String){
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        backgroundColor = UIColor(red: 13.0 / 255.0, green: 8.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
        layer.cornerRadius = 12.0
        configureLayout()
    }
    
    
    private func configureLayout(){
        
        addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(textContainerView)
        textContainerView.addSubview(titleLabel)
        textContainerView.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 16),
            
            textContainerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            textContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            titleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: textContainerView.topAnchor),
            
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 4),
            subTitleLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor),
        ])
    }
    


}
