//
//  MeterInfoRequest.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 3.06.2023.
//

import Foundation


struct MeterInfoRequest : CodableReturningRequest, ErrorLoggableRequest {
    typealias ResponseType = MeterInfoResponse
    
    
    var data: RequestData {
        let path = NetworkingConstants.meterAIApi + "/meter/getmeterinfo"
        let header = NetworkingConstants.authHeader
        return RequestData(path: path, method: .get, params: nil, headers: header)
    }
}
