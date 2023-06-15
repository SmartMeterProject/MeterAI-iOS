//
//  CustomError.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import Foundation


struct CustomError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
}
