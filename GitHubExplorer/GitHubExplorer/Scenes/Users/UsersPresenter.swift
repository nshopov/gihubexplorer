//
//  UsersPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation
import GithubAPI

public class UsersPresenter {
    private var usersView: UsersView!
    public init(_ usersView: UsersView) {
        self.usersView = usersView
    }
    
    private let userAPIservice: UserAPI  = AppServiceLocator.shared.getService()!
    public func getFollwingUsers() {
        self.userAPIservice.getFollowingUsers { (response, error) in
            if let response = response,
               response.count > 0 {
                self.usersView.loadUsers(Converter.toFollowUsersDTOArray(response))
            } else {
                self.usersView.showErrorMessage?("There were problems getting following users")
            }
        }
    }
    
    public func onSelect(_ user: FollowUserDTO) {
        self.usersView.showRepositoriesFor(user)
    }
}
