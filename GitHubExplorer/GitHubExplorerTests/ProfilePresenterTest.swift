//
//  ProfilePresenterTest.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 29.05.22.
//

import Foundation
import XCTest
@testable import GitHubExplorer

public class ProfilePresenterTest: XCTestCase {
    private var sampleDTONoFollowers = UserDTO(avatarUrl: "",
                                    collaborators: 0,
                                    company: "TestCo.LTD",
                                    createdAt: "",
                                    email: "teset.user@gmail.com",
                                    followers: 0,
                                    followersUrl: "",
                                    following: 3,
                                    followingUrl: "",
                                    gravatarId: "",
                                    id: 1,
                                    login: "tesetuser",
                                    name: "Test User",
                                    publicRepos: 2,
                                    reposUrl: "",
                                    starredUrl: "",
                                    subscriptionsUrl: "",
                                    totalPrivateRepos: 1,
                                    type: "",
                                    url: "")
    
    private var sampleDTOWithFollowers = UserDTO(avatarUrl: "",
                                    collaborators: 0,
                                    company: "TestCo.LTD",
                                    createdAt: "",
                                    email: "teset.user@gmail.com",
                                    followers: 4,
                                    followersUrl: "",
                                    following: 3,
                                    followingUrl: "",
                                    gravatarId: "",
                                    id: 1,
                                    login: "testuser",
                                    name: "Test User",
                                    publicRepos: 2,
                                    reposUrl: "",
                                    starredUrl: "",
                                    subscriptionsUrl: "",
                                    totalPrivateRepos: 1,
                                    type: "",
                                    url: "")
    
    private var profileView: ProfileSpyView! = nil
    private var profilePresenter: ProfilePresenter! = nil
    
    public override func setUp() {
        profileView = ProfileSpyView()
        profilePresenter = ProfilePresenter(profileView)
    }
    
    public func testFollowingUsersButton() {
        profilePresenter.load(sampleDTONoFollowers)
        XCTAssertTrue(profileView.isFollowingButtonEnabled
                   && profileView.followingButtonTitle == "3 Following")
    }
    
    public func testFollowersDisabled() {
        profilePresenter.load(sampleDTONoFollowers)
        XCTAssertTrue(!profileView.isFollowersButtonEnabled)
    }
    
    public func testFillowersEnabledAndTitleIsRight() {
        profilePresenter.load(sampleDTOWithFollowers)
        XCTAssertTrue(profileView.isFollowersButtonEnabled
                      && profileView.followersButtonTitle == "4 Followers" )
    }
    
    public func testRepositoriesLoaded() {
        let expectation = expectation(description: "Load Repositories")
        profileView.theExpectation = expectation
        
        profilePresenter.load(sampleDTOWithFollowers)
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(profileView.loadRepositoriesHasBeenCalled
                   && profileView.repositories?.count ?? 0 > 0)
    }
}
