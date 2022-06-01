//
//  RepositoriesSpyView.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 30.05.22.
//

import Foundation
import XCTest

public class RepositoriesSpyView: RepositoriesView {
    private(set) public var repositoriesAreLoaded = false
    private(set) public var repositoryDetailCalled = false
    private(set) public var erorrOccurred = false
    
    public var theExpectation: XCTestExpectation?
    
    public func loadRepositories(_ repositories: [RepositoryDTO]?) {
        if let repositories = repositories {
            repositoriesAreLoaded = true
            theExpectation?.fulfill()
        }
    }
    
    public func showRepositoryDetail(_ repository: RepositoryDTO) {
        self.repositoryDetailCalled = true
    }
    
    public func showErrorMessage(_ message: String) {
        self.theExpectation?.fulfill()
        self.erorrOccurred = true
    }
}
