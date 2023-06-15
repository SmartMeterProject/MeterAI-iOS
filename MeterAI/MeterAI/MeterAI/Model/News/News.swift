//
//  News.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import Foundation


//struct News {
//    let title : String
//    let description : String
//    let time : String
//    let type : SlideTypes
//}

struct NewNews : Codable {
    let meterType : MeterType
    let title : String
    let content : String
    let contentImagePath : String
    let author : String
}

enum MeterType : Int, Codable {
    case electric = 1
    case gas = 0
    case water = 2
}

