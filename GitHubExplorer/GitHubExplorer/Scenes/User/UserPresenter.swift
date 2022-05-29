//
//  UserPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation
import GithubAPI

class UserPresenter {
    private var userView: UserView
    private let userAPIservice: UserAPI? = nil
    
    public init(_ userView: UserView) {
        self.userView = userView
    }
    
  
}
