//
//  NewsTableViewCell.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell, ClassNameGettable {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var isReadView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var smallImageView: UIImageView!
    
    static let cellId = "NewsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(decription: String, type: MeterType, time:String, imageURL : String) {
    
        descriptionLabel.text = decription
        timeLabel.text = time
        
        switch type {
        case .electric:
            categoryLabel.text = "ELEKTRİK"
            categoryLabel.textColor = .brown
            smallImageView.setNetworkImage(urlStr: imageURL)
        case .gas:
            categoryLabel.text = "DOĞALGAZ"
            smallImageView.setNetworkImage(urlStr: imageURL)
            categoryLabel.textColor = .black
            
        case .water:
            categoryLabel.text = "SU"
            smallImageView.setNetworkImage(urlStr: imageURL)
            if #available(iOS 15.0, *) {
                categoryLabel.textColor = .systemCyan
            } else {
                categoryLabel.textColor = .cyan
            }
        }
    }
    
    

    
}
