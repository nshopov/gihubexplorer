//
//  GitHubExplorerIntegrationTests.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 29.05.22.
//

import Foundation
import XCTest
import GithubAPI
import BaseAPI


@testable import GitHubExplorer


class GitHubExplorerIntegrationTests: XCTestCase {
    
    // Remark: Do put these into a constant or config file which is .gitignored!
    private let username = "nshopov"
    private let password = "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"
    
    
    private var authentication: BasicAuthentication! = nil
    private var userAPI: UserAPI! = nil
    
    
    override func setUp() {
        authentication = BasicAuthentication(username: username, password: password)
        userAPI = UserAPI(authentication: authentication)
    }
    
    func testLogin() throws {
        // Create an expectation
        let expectation = self.expectation(description: "Login")
        var isLoggedin = false
        
        userAPI.getUser { response, error in
            if let response = response,
               let id = response.id {
                expectation.fulfill()
                isLoggedin = true
            }
         
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(isLoggedin)
    }
    
    
    public func testFollowingUsersWithActuallyHavigUsersTheLoggedInUserFollows() throws {
        let expectation = self.expectation(description: "has following users")
        var usersToFollowFound = false
        
        
        userAPI.getFollowingUsers { response, error in
            if let response = response,
                response.count > 0  {
                expectation.fulfill()
                usersToFollowFound = true
            }
        }
        
        waitForExpectations(timeout: 5)
        
        
        XCTAssertTrue(usersToFollowFound)
    }
    
    public func testUserHasNoFollowers() throws {
        let expectation = self.expectation(description: "has following users")
        var userHasNoFollowers = false
        
        
        userAPI.getFollowerUsers { response, error in
            if let response = response,
               response.count ==  0  {
                expectation.fulfill()
                userHasNoFollowers = true
            }
        }
        
        waitForExpectations(timeout: 5)
        
        
        XCTAssertTrue(userHasNoFollowers)
    }
    
    public func testGetPublicRepositories() {
        let repositoriesAPI = RepositoriesAPI()
        
        let expectation = expectation(description: "Repositories")
        
        var repositoriesRetrieved = false
        
        repositoriesAPI.repositories(user: "nshopov", type: .public, sort: .none, direction: .asc) { response, error in
            if response != nil {
                expectation.fulfill()
                repositoriesRetrieved = true
            } else {
                print(error as Any)
            }
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(repositoriesRetrieved)
    }
    
    public func  testSearch() {
        let searchCriteria = "paul"
        
        let searchAPI = SearchAPI()
        
        var searchHasResults = true
        
        let searchExpectation = expectation(description: "Search expectation")
        
        searchAPI.searchUsers(q: searchCriteria) { response, error in
            if let response = response,
               let items = response.items,
               items.count > 0 {
                searchHasResults = true
                searchExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(searchHasResults)
    }
}
