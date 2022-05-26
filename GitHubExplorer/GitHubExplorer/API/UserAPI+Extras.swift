//
//  GitHubAPI.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 23.05.22.
//

import Foundation
import GithubAPI

extension UserAPI {
    public func getFollwingUsers(completion: @escaping([FollowingResponse]?, Error?) -> Void) {
        super.gh_get(path: "/user/following", completion: completion)
    }
}
