//
//  GitHubAPI.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 23.05.22.
//

import Foundation
import GithubAPI

extension UserAPI {
    public func getFollowingUsers(completion: @escaping([FollowResponse]?, Error?) -> Void) {
        super.gh_get(path: "/user/following", completion: completion)
    }
    
    public func getFollowerUsers(completion: @escaping([FollowResponse]?, Error?) -> Void) {
        super.gh_get(path: "/user/followers", completion: completion)
    }
}
