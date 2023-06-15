//
//  DeviceAPIManager.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import Foundation
import OneSignal


protocol DeviceService {
    func updateDevice(completion : @escaping (Result<Bool, Error>) -> ())
}


struct DeviceAPIManager : DeviceService {
    
    func updateDevice(completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let pushToken = OneSignal.getDeviceState()?.userId else{completion(.failure(CustomError("Push token not found")))
            return
        }
        
        let request = UpdateDeviceRequest(params: UpdateDeviceRequest.Params(oneSignalId: pushToken))
        
        request.execute {
            completion(.success(true))
        } onError: { error in
            completion(.failure(error))
        }

    }
    
}
