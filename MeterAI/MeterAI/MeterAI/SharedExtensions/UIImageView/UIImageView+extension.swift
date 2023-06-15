//
//  UIImageView+extension.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 21.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setNetworkImage(urlStr: String?) {
        guard let string = urlStr, let url = URL(string: string) else {
            self.image = UIImage(named: "default")
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
            switch result{
            case .success(let img):
                self.image = img.image
            case .failure(_):
                self.image = UIImage(named: "default")
            }
        }
    }
}
