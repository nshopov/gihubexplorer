//
//  SearchSpyView.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 31.05.22.
//

import Foundation
import XCTest

public class SearchSpyView: SearchView {
    public var theExpectation: XCTestExpectation?
    public var searchResultsAvailable = false
    
    public func loadSearchResults(_ items: [FollowUserDTO]) {
        self.theExpectation?.fulfill()
        
        if items.count > 0 {
            self.searchResultsAvailable = true
        }
    }
    
}
