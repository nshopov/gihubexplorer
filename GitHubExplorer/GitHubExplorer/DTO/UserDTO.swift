//
//  UserDTO.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 26.05.22.
//

import Foundation

struct UserDTO: Codable {
    public let avatarUrl : String?
    public let collaborators : Int?
    public let company : String?
    public let createdAt : String?
    public let email : String?
    public let followers : Int?
    public let followersUrl : String?
    public let following : Int?
    public let followingUrl : String?
    public let gravatarId : String?
    public let id : Int?
    public let login : String?
    public let name : String?
    public let publicRepos : Int?
    public let reposUrl : String?
    public let starredUrl : String?
    public let subscriptionsUrl : String?
    public let totalPrivateRepos : Int?
    public let type : String?
    public let url : String?
}
