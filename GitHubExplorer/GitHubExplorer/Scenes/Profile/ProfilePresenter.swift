//
//  UserPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation
import GithubAPI

class ProfilePresenter {
    private var profileView: ProfileView
    private let userAPIservice: UserAPI? = nil

    private let repositoriesAPI = RepositoriesAPI()
    
    public init(_ profileView: ProfileView) {
        self.profileView = profileView
    }
    
    public func onRepoSelected(_ repoData: RepositoryDTO) {
        self.profileView.showRepoDetail(repoData)
    }
    
    func load(_ userData: UserDTO?){
        if let imgUrl = URL(string: userData?.avatarUrl ?? ""),
           let data = try? Data(contentsOf: imgUrl) {
            profileView.setAvatarImage(imgData: data)
        }
        
        profileView.setFollowingAtributes("\(userData?.following ?? 0) Following",
                                       isEnabled: (userData?.following ?? 0 > 0))
        
        profileView.setFollowersAtrributes("\(userData?.followers ?? 0) Followers",
                                        isEnabled: (userData?.followers ?? 0 > 0))
        
        guard let userName = userData?.login else {
            self.profileView.showErrorMessage("Public repositories data not possible to load!")
            return
        }
        
        repositoriesAPI.repositories(user: userName,
                                     type: .public,
                                     sort: .none,
                                     direction: .asc) { [unowned self] response, error in
            if let repsponse = response {
                let repositories = Converter.toRepositoriesDTOArray(repoResponseArray: repsponse)
                self.profileView.loadRepositories(repositories)
            } else {
                self.profileView.showErrorMessage("Public repositories data not possible to load!")
            }
        }
    }
}
