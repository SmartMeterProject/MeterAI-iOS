//
//  ClassNameGettable.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import Foundation


public protocol ClassNameGettable {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameGettable {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
