//
//  UITableView.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import Foundation

import UIKit

extension UITableView {
    func register(with commonId: String) {
        register(UINib(nibName: commonId, bundle: nil), forCellReuseIdentifier: commonId)
    }
}
