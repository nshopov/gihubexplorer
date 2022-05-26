//
//  Converter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 26.05.22.
//

import Foundation
import GithubAPI

struct Converter {
    public static func toUserDTO(_ resposne: UserResponse) -> UserDTO {
        let result = UserDTO(avatarUrl: resposne.avatarUrl,
                             collaborators: resposne.collaborators,
                             company: resposne.company,
                             createdAt: resposne.createdAt,
                             email: resposne.email,
                             followers: resposne.followers,
                             followersUrl: resposne.followersUrl,
                             following: resposne.following,
                             followingUrl: resposne.followingUrl,
                             gravatarId: resposne.gravatarId,
                             id: resposne.id,
                             login: resposne.login,
                             name: resposne.name,
                             publicRepos: resposne.publicRepos,
                             reposUrl: resposne.reposUrl,
                             starredUrl: resposne.starredUrl,
                             subscriptionsUrl: resposne.subscriptionsUrl,
                             totalPrivateRepos: resposne.totalPrivateRepos,
                             type: resposne.type,
                             url: resposne.url)
        
        return result
    }
}
