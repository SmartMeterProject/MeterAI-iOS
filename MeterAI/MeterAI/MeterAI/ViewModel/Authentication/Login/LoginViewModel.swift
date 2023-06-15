//
//  LoginViewModel.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 6.06.2023.
//

import Foundation


protocol LoginViewModelOutput : AnyObject {
    func login(result : Result<LoginResponseModel, Error>)
}


class LoginViewModel {
    
    let loginService : AuthenticationService
    weak var output : LoginViewModelOutput?
    
    init(loginService: AuthenticationService) {
        self.loginService = loginService
    }
    
    
    func login(email: String?, password : String?){
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else {
            let error = CustomError("Email and password are required.")
            self.output?.login(result: .failure(error))
            return
        }
        
        let requestModel = LoginRequestModel(email: email, password: password)
        loginService.login(params: requestModel) { [weak self] result in
            self?.output?.login(result: result)
        }
        
    }
    
}
