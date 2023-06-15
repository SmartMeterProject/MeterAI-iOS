//
//  AuthenticationAPIManager.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import Foundation


protocol AuthenticationService {
    func login(params : LoginRequestModel, completion: @escaping (Result<LoginResponseModel,Error>) -> Void)
}


struct AuthenticationAPIManager : AuthenticationService {
    func login(params: LoginRequestModel, completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        let loginRequest = LoginRequest(params: params)
        loginRequest.execute { response in
            completion(.success(response))
        } onError: { error in
            completion(.failure(error))
        }

    }
}
