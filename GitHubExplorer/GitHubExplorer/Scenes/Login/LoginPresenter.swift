//
//  LoginPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 24.05.22.
//

import Foundation
import GithubAPI
import Moya


class LoginPresenter {
    private var loginView: LoginView
    
    public init(_ loginView: LoginView) {
        self.loginView = loginView
    }
    
    public func doLogin(_ username: String, _ password: String) {
        loginView.showLoadingStatus()
        
        // do the login
        let authentication = BasicAuthentication(username: username, password: password)
        
        let userApi = UserAPI(authentication: authentication)
        
        AppServiceLocator.shared.addService(service: userApi)
        userApi.getUser { [unowned self] (response, error) in
            if let response = response,
               let id = response.id {
                self.loginView.hideLoadingStatus()
                let userData = Converter.toUserDTO(response)
                self.loginView.loginCompleted(userData)
            } else {
                loginView.showErrorMessage("There is problem with login, check your credentials")
                loginView.clear()
            }
        }
        
        
        
    }
}
