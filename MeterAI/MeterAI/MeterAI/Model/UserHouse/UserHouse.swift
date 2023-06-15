//
//  UserHouse.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 21.05.2023.
//

import Foundation


struct UserHouse : Codable {
    let houseName : String
    let userMeters : [UserMeter]
}
