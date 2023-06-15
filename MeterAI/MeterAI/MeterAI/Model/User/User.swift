//
//  User.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 21.05.2023.
//

import Foundation

class User : Codable {

    private init(){}

    static let current = User()

    var appLanguage: String {
        return Locale.current.languageCode ?? "en"
    }
    
    var userMeterInfo : MeterInfoResponse? {
        get {
            if let data = UserDefaults.standard.value(forKey: "userMeterInfo") as? Data {
                let progressInfos = try? PropertyListDecoder().decode(MeterInfoResponse.self, from: data)
                return progressInfos ?? nil
            }
            return nil
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue),forKey: "userMeterInfo")
        }
    }
    
    
    var JWT: String? {
        get {
            return UserDefaults.standard.string(forKey: "jsonwebtoken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "jsonwebtoken")
        }
    }
    


}
