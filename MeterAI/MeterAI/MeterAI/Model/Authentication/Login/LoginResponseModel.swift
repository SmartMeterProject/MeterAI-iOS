//
//  LoginResponse.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 13.05.2023.
//

import Foundation

struct LoginResponseModel : Codable {
    let data : LoginResponseData
}


struct LoginResponseData : Codable {
    let token : String
    let getMeterInfoResponse : MeterInfoResponse
}

