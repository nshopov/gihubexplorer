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
            else {
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(isLoggedin)
    }
    
    
    func testFollowingUsers() throws {
        
    }
}
