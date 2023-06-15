//
//  LoginViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 26.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }
    
    var loginViewModel : LoginViewModel?
    
    private func customInit(){
        loginViewModel = LoginViewModel(loginService: AuthenticationAPIManager())
        loginViewModel?.output = self
    }
    
    private func createBlurView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    @IBAction func tappedLogin(_ sender: Any) {
        loginViewModel?.login(email: emailTextField.text, password: passwordTextField.text)
    }
    
    private func rootMain(){
        
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarViewController else {
            return
        }
       
       createBlurView()
       view.bringSubviewToFront(activityIndicator)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] timer in
            UIApplication.shared.windows.first?.rootViewController = rootVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }

}

extension LoginViewController : LoginViewModelOutput {
    func login(result: Result<LoginResponseModel, Error>) {
        switch result {
        case .success(let response):
            User.current.JWT = response.data.token
            User.current.userMeterInfo = response.data.getMeterInfoResponse
            self.rootMain()
        case .failure(let error):
            print(error)
        }
    }

}
