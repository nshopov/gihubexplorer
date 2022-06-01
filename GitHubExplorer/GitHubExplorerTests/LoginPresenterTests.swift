//
//  GithubExplorerPresentersTests.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 29.05.22.
//

import Foundation
import XCTest

@testable import GitHubExplorer

class LoginPresenterTests: XCTestCase {
    
    private let username = ProcessInfo.processInfo.environment["username"]!
    private let password = ProcessInfo.processInfo.environment["password"]!
     
    private var loginSpyView: LoginSpyView! = nil
    private var loginPresenter: LoginPresenter! = nil
    
    override func setUp() {
        loginSpyView = LoginSpyView()
        loginPresenter = LoginPresenter(loginSpyView)
    }
    
    public func testLoginPresenterLoginSuccessfully() {
        let expectation = expectation(description: "Login")
        var loginSuccessfull = false
        loginSpyView.theExpectation = expectation
        
        loginPresenter.doLogin(username, password)
        
        waitForExpectations(timeout: 5)
            
        if loginSpyView.loginCompletedSuccessfully  {
            loginSuccessfull = true
        }
        
        XCTAssertTrue(loginSuccessfull)
    }
    
    
    public func testLoginPresenterLoginUnsuccessfully_andShowError_andFieldsAreCleared() {
        let expectation = expectation(description: "Login error")
        var userNotLoggedIn_and_ready_for_new_login = false
        loginSpyView.theExpectation = expectation
        
        loginPresenter.doLogin("unsuccessful", "password")
        
        waitForExpectations(timeout: 5)
        
        if !loginSpyView.loginCompletedSuccessfully
            && loginSpyView.errorMessageShown
            && loginSpyView.clearHasBeenCalled {
            userNotLoggedIn_and_ready_for_new_login = true
        }
        
        XCTAssertTrue(userNotLoggedIn_and_ready_for_new_login)
    }
    
    public func testLoginPresenterIfUsersIsLoggedIn_NavigateToProfileScreen() {
        
        let sampleDTONoFollowers = UserDTO(avatarUrl: "",
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
        
        Storage.shared.setObjectFor(key: "ProfileUserData", val: sampleDTONoFollowers)
        
        loginPresenter.present()
        
        XCTAssertTrue(loginSpyView.loginCompletedSuccessfully)
        
        Storage.shared.removeObjectFor(key: "ProfileUserData")
    }
}
