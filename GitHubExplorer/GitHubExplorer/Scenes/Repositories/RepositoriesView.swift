//
//  RepositoriesView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 28.05.22.
//

import Foundation

public protocol RepositoriesView: BaseView {
    func loadRepositories(_ repositories: [RepositoryDTO]?)
    func showRepositoryDetail(_ repository: RepositoryDTO)
}
