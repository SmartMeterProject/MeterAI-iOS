//
//  NetworkingConstants.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 13.05.2023.
//

import Foundation


struct NetworkingConstants {

    #if DEBUG
    static let meterAIApi = "http://yildizbilal000-001-site1.ftempurl.com"
    #else
    static let meterAIApi = "http://yildizbilal000-001-site1.ftempurl.com"
    #endif


    

    static var defaultHeader: [String : String]? {

        let defaultHeader = [
            "Content-Type": "application/json"
        ]
        return defaultHeader
    }
    
    
    static var authHeader: [String : String]? {

        let authHeader = [
            "Content-Type": "application/json",
            "Authorization" : "Bearer " + (User.current.JWT ?? ""),
        ]
        return authHeader
    }
    




    static let rawRequestList = [""]
}


