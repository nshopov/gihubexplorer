//
//  LoginView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 24.05.22.
//

import GithubAPI
protocol LoginView {
    func showLoadingStatus()
    func hideLoadingStatus()
    func loginCompleted(_ userResponse: UserDTO)
}
