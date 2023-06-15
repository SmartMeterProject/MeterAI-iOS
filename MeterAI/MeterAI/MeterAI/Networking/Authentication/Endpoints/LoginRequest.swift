//
//  LoginRequest.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 13.05.2023.
//

import Foundation


struct LoginRequest : CodableReturningRequest, ErrorLoggableRequest {
    typealias ResponseType = LoginResponseModel
    
    var params : LoginRequestModel?
   
    var data: RequestData {
        let path = NetworkingConstants.meterAIApi + "/Auth/login"
        let header = NetworkingConstants.defaultHeader
        return RequestData(path: path, method: .post, params: params?.asDictionary(), headers: header)
    }
}
