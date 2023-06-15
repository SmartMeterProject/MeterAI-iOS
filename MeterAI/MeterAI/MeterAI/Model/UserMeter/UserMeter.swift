//
//  UserMeter.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 21.05.2023.
//

import Foundation

struct UserMeter : Codable {
    let meterType : MeterType
    let invoicePrice : String
    let consumptionAmount : String
    let endOfMonthForecast : String?
}
