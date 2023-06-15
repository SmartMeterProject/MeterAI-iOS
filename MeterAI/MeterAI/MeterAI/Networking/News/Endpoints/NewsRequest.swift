//
//  NewsRequest.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 21.05.2023.
//

import Foundation


struct NewsRequest : CodableReturningRequest, ErrorLoggableRequest {
    typealias ResponseType = NewsResponse
    
    
    var data: RequestData {
        let path = NetworkingConstants.meterAIApi + "/New/getallnews"
        let header = NetworkingConstants.authHeader
        return RequestData(path: path, method: .get, params: nil, headers: header)
    }
}
