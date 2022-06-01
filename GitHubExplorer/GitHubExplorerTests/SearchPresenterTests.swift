//
//  SearchPresenterTests.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 31.05.22.
//

import Foundation
import XCTest
@testable import GitHubExplorer

public class SearchPresenterTests: XCTestCase {
    var searchPresenter: SearchPresenter! = nil
    var searchView: SearchSpyView! = nil
    
    public override func setUp() {
        searchView = SearchSpyView()
        searchPresenter = SearchPresenter(searchView)
    }
    
    
    public func testSearchWithResults() {
        let expectation = expectation(description: "search expecataiton ")
        
        searchView.theExpectation = expectation
        searchPresenter.search("nshopov")
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(searchView.searchResultsAvailable)
    }
}
