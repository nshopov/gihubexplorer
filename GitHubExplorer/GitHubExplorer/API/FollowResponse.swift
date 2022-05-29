//
//  FollwingResponse.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation
public struct FollowResponse: Codable {
    
    public let  login: String
    public let  id: Int
    public let  nodeId: String
    public let    avatarUrl: String
    public let    gravatarId: String
    public let    url: String
    public let    htmlUrl: String
    public let    followersUrl: String
    public let    followingUrl: String
    public let    gistsUrl: String
    public let    starredUrl: String
    public let    subscriptionsUrl: String
    public let    organizationsUrl: String
    public let    reposUrl: String
    public let    eventsUrl: String
    public let    receivedEventsUrl: String
    public let    type: String
    public let    siteAdmin: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try values.decode(String.self, forKey: .login)
        self.id = try values.decode(Int.self, forKey: .id)
        self.nodeId = try values.decode(String.self, forKey: .nodeId)
        self.avatarUrl = try values.decode(String.self, forKey: .avatarUrl)
        self.gravatarId = try values.decode(String.self, forKey: .gravatarId)
        self.url = try values.decode(String.self, forKey: .url)
        self.htmlUrl = try values.decode(String.self, forKey: .htmlUrl)
        self.followersUrl = try values.decode(String.self, forKey: .followersUrl)
        self.followingUrl = try values.decode(String.self, forKey: .followingUrl)
        self.gistsUrl = try values.decode(String.self, forKey: .gistsUrl)
        self.starredUrl = try values.decode(String.self, forKey: .starredUrl)
        self.subscriptionsUrl = try values.decode(String.self, forKey:.subscriptionsUrl)
        self.organizationsUrl = try values.decode(String.self, forKey: .organizationsUrl)
        self.reposUrl = try values.decode(String.self, forKey: .reposUrl)
        self.eventsUrl = try values.decode(String.self, forKey: .eventsUrl)
        self.receivedEventsUrl = try values.decode(String.self, forKey: .receivedEventsUrl)
        self.type = try values.decode(String.self, forKey: .type)
        self.siteAdmin = try values.decode(Bool.self, forKey: .siteAdmin)
    }
    
}
