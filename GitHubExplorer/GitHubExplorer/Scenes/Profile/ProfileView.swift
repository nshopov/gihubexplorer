//
//  UserView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation

protocol ProfileView: BaseView {
    func showErrorMessage(_ message: String)
    func setFollowingAtributes(_ title: String, isEnabled: Bool)
    func setFollowersAtrributes(_ ttle: String, isEnabled: Bool)
    func setAvatarImage(imgData: Data)
    func loadRepositories(_ repositories: [RepositoryDTO])
    func showRepoDetail(_ repoData: RepositoryDTO)
    func navigateToLoginScreen() 
}
