//
//  UpdateDeviceRequest.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import Foundation


struct UpdateDeviceRequest : RequestType {
    
    struct Params : Codable {
        let oneSignalId : String
    }

    var params : Params
               
    var data: RequestData {
        let path = NetworkingConstants.meterAIApi + "/onesignal/updatedeviceid"
        let header = NetworkingConstants.authHeader
        return RequestData(path: path, method: .post, params: params.asDictionary(), headers: header)
    }
}

