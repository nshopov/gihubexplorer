//
//  ProfileSpyView.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 29.05.22.
//

import Foundation
import XCTest

public class ProfileSpyView: ProfileView {
    public var theExpectation: XCTestExpectation?
    
    private(set) var isFollowingButtonEnabled = false
    private(set) var isFollowersButtonEnabled = false
    
    private(set) var followingButtonTitle = ""
    private(set) var followersButtonTitle = ""
    private(set) var errorIsShown = false
    private(set) var loadRepositoriesHasBeenCalled = false
    
    private(set) var repositories: [RepositoryDTO]? = nil
    
    public func showErrorMessage(_ message: String) {
        errorIsShown = true
    }
    
    func setFollowingAtributes(_ title: String, isEnabled: Bool) {
        followingButtonTitle = title
        isFollowingButtonEnabled = isEnabled
    }
    
    func setFollowersAtrributes(_ title: String, isEnabled: Bool) {
        followersButtonTitle = title
        isFollowersButtonEnabled = isEnabled
    }
    
    func setAvatarImage(imgData: Data) {
        
    }
    
    func showRepoDetail(_ repoData: RepositoryDTO) {
        
    }
    
    func loadRepositories(_ repositories: [RepositoryDTO]) {
        self.repositories = repositories
        self.loadRepositoriesHasBeenCalled = true
        self.theExpectation?.fulfill()
    }
}
