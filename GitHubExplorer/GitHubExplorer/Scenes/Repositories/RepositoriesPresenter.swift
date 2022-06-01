//
//  RepositoriesPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 28.05.22.
//

import Foundation
import GithubAPI

public class RepositoriesPresenter {
    private let reposView: RepositoriesView
    private let repositoriesAPI = RepositoriesAPI()
    
    public init (_ reposView: RepositoriesView) {
        self.reposView = reposView
    }
    
    public func getRepositoriesFor(_ username: String) {
        repositoriesAPI.repositories(user: username,
                                     type: .public,
                                     sort: .none,
                                     direction: .asc) { [unowned self] response, error in
            if let repsponse = response {
                let repositories = Converter.toRepositoriesDTOArray(repoResponseArray: repsponse)
                self.reposView.loadRepositories(repositories)
            } else {
                self.reposView.showErrorMessage?("Public repositories data not possible to load!")
            }
        }
    }
    
    public func onSelectRepository(_ repoData: RepositoryDTO) {
        self.reposView.showRepositoryDetail(repoData)
    }
}
