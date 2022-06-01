//
//  File.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 30.05.22.
//

import Foundation
import XCTest
@testable import GitHubExplorer

public class RepositoriesPresenterTests: XCTestCase {
    var repositoriesPresenter: RepositoriesPresenter! = nil
    var repositoriesView: RepositoriesSpyView! = nil
    
    
    public override func setUp() {
        repositoriesView = RepositoriesSpyView()
        repositoriesPresenter = RepositoriesPresenter(repositoriesView)
    }
    
    
    public func testLoadRepositories() {
        let userName = "twostraws"
        
        let reposExpectation = expectation(description: "getRepositroies")
        
        repositoriesView.theExpectation = reposExpectation
        
        repositoriesPresenter.getRepositoriesFor(userName)
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(repositoriesView.repositoriesAreLoaded)
    }
    
    
    public func testLoadRepositoriesThrowsAnError() {
        let reposExpectation = expectation(description: "getRepositories_withanError")
        
        repositoriesView.theExpectation = reposExpectation
        
        repositoriesPresenter.getRepositoriesFor("")
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(repositoriesView.erorrOccurred)
    }
    
    public func testRepoOnSelected() {
        let repo = RepositoryDTO(archiveUrl: "",
                                 archived: false,
                                 assigneesUrl: "",
                                 collaboratorsUrl: "",
                                 createdAt: "",
                                 defaultBranch: "",
                                 fullName: "",
                                 id: 0,
                                 issueCommentUrl: "",
                                 issueEventsUrl: "",
                                 issuesUrl: "",
                                 keysUrl: "",
                                 labelsUrl: "",
                                 language: "",
                                 languagesUrl: "",
                                 mergesUrl: "",
                                 milestonesUrl:"",
                                 name: "",
                                 privateField: false,
                                 pullsUrl: "",
                                 sshUrl: "",
                                 subscribersCount: 0,
                                 subscribersUrl: "",
                                 subscriptionUrl: "",
                                 updatedAt: "",
                                 url: "",
                                 watchersCount: 0)
        
        repositoriesPresenter.onSelectRepository(repo)
        
        XCTAssertTrue(repositoriesView.repositoryDetailCalled)
    }
}
