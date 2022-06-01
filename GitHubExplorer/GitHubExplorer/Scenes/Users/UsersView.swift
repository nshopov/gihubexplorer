//
//  UsersView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation

public protocol UsersView: BaseView {
    func loadUsers(_ users: [FollowUserDTO])
    func showRepositoriesFor(_ user: FollowUserDTO)
}
