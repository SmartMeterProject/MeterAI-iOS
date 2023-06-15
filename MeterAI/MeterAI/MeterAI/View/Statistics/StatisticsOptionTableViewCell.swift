//
//  StatisticsOptionTableViewCell.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import UIKit

class StatisticsOptionTableViewCell: UITableViewCell {
    
    
    static let cellID = "StatisticsOptionTableViewCell"
    
    private lazy var containerView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderColor = .white
        v.borderWidth = 1.0
        v.backgroundColor = .clear
        v.cornerRadius = 12.0
        return v
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var arrowImage : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "arrow.right")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureAttr(title : String?){
        self.titleLabel.text = title ?? ""
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func configure(){
        configureLayout()
    }
    
    private func configureLayout(){
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            arrowImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: 32),
            arrowImage.widthAnchor.constraint(equalToConstant: 32),
            arrowImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
            
        ])
    }
    
    
}
