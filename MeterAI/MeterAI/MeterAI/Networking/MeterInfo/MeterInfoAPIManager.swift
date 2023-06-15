//
//  MeterInfoAPIManager.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 5.06.2023.
//

import Foundation

protocol MeterInfoService {
    func getMeterInfo(completion: @escaping (Result<MeterInfoResponse, Error>) -> Void)
}

struct MeterInfoAPIManager : MeterInfoService {
    
    func getMeterInfo(completion: @escaping (Result<MeterInfoResponse, Error>) -> Void) {
        let getMeterInfoRequest = MeterInfoRequest()
        getMeterInfoRequest.execute { response in
            completion(.success(response))
        } onError: { error in
            completion(.failure(error))
        }
    }
}
