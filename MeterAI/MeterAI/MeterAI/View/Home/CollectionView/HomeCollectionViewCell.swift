//
//  HomeCollectionViewCell.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 28.01.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    static let identifier = String(describing: HomeCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleView: UILabel!
    @IBOutlet weak var slidePriceView: UILabel!
    
    
    var delegate : HomeCollectionViewCellDelegate?
    
    @IBOutlet weak var containerView: UIView!
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    
    var slideType : MeterType = .gas
    
    func configureCell(_ meterInfo : UserMeter){
       
        switch meterInfo.meterType {
        case .gas:
            slideTitleView.text = "Doğalgaz Faturası"
            slideType = .gas
        case .electric:
            slideTitleView.text = "Elektrik Faturası"
            slideType = .electric
        case .water:
            slideTitleView.text = "Su Faturası"
            slideType = .water
        }
       
        slidePriceView.text = String(meterInfo.invoicePrice) + " TL"
        
        containerView.layer.cornerRadius = 12.0
       // configureGradientView(containerView)

        
       
        
       // delegate?.setPageControl(type: slide)
    }
    
    private func configureGradientView(_ view : UIView){
        let colorTop =  UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.0]
        gradientLayer.frame = self.containerView.bounds
        gradientLayer.cornerRadius = 12.0
        
        self.containerView.layer.insertSublayer(gradientLayer, at:0)
    }
    
}

protocol HomeCollectionViewCellDelegate{
    func setPageControl(type : MeterType)
}


