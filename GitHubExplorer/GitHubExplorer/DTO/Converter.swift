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
    
    public static func toFollowUserDTO(_ userItem: SearchUsersItem) -> FollowUserDTO {
        let result = FollowUserDTO(login: userItem.login ?? "",
                                   id: userItem.id ?? 0,
                                   avatarUrl: userItem.avatarUrl ?? "",
                                   url: userItem.url ?? "",
                                   reposUrl: userItem.reposUrl ?? "")
        return result
    }
    
    public static func toFollowUsersDTOArray(_ searchItems: [SearchUsersItem]) -> [FollowUserDTO]{
        let result = searchItems.map { Converter.toFollowUserDTO($0) }
        return result
    }
    
    public static func toFollowUserDTO(_ followResponse: FollowResponse) -> FollowUserDTO {
        let result = FollowUserDTO(login: followResponse.login,
                                   id: followResponse.id,
                                   avatarUrl: followResponse.avatarUrl,
                                   url: followResponse.url, reposUrl: followResponse.reposUrl)
        return result
    }
    
    public static func toFollowUsersDTOArray(_ followResponseArray: [FollowResponse]) -> [FollowUserDTO] {
        let result = followResponseArray.map { Converter.toFollowUserDTO($0)}
        return result
    }
    
    public static func toRepositoryDTO (_ repoResponse: RepositoryResponse) -> RepositoryDTO {
        let result = RepositoryDTO(archiveUrl: repoResponse.archiveUrl,
                                   archived: repoResponse.archived,
                                   assigneesUrl: repoResponse.assigneesUrl,
                                   collaboratorsUrl: repoResponse.collaboratorsUrl,
                                   createdAt: repoResponse.createdAt,
                                   defaultBranch: repoResponse.defaultBranch,
                                   fullName: repoResponse.fullName,
                                   id: repoResponse.id,
                                   issueCommentUrl: repoResponse.issuesUrl,
                                   issueEventsUrl: repoResponse.issueEventsUrl,
                                   issuesUrl: repoResponse.issuesUrl,
                                   keysUrl: repoResponse.keysUrl,
                                   labelsUrl: repoResponse.labelsUrl,
                                   language: repoResponse.language,
                                   languagesUrl: repoResponse.languagesUrl,
                                   mergesUrl: repoResponse.mergesUrl,
                                   milestonesUrl: repoResponse.milestonesUrl,
                                   name: repoResponse.name,
                                   privateField: repoResponse.privateField,
                                   pullsUrl: repoResponse.pullsUrl,
                                   sshUrl: repoResponse.sshUrl,
                                   subscribersCount: repoResponse.subscribersCount,
                                   subscribersUrl: repoResponse.subscribersUrl,
                                   subscriptionUrl: repoResponse.subscriptionUrl,
                                   updatedAt: repoResponse.updatedAt,
                                   url: repoResponse.url,
                                   watchersCount: repoResponse.watchersCount)
        return result
    }
    
    public static func toRepositoriesDTOArray(repoResponseArray: [RepositoryResponse]) -> [RepositoryDTO] {
        let result = repoResponseArray.map { Converter.toRepositoryDTO($0) }
        return result
    }
}
