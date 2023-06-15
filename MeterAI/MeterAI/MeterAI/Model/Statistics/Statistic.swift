//
//  StatisticType.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import Foundation


struct Statistic {
    let title : String?
    let type : StatisticType?
}

enum StatisticType {
    case weekly
    case monthly
    case year
}
