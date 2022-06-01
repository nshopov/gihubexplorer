//
//  SearchPresenter.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 31.05.22.
//

import Foundation
import GithubAPI

public class SearchPresenter {
    private var serachView: SearchView!
    private let searchAPI = SearchAPI()
    
    public init (_ serachView: SearchView) {
        self.serachView = serachView
    }
    
    public func search(_ searchCriteria: String) {
    self.searchAPI.searchUsers(q: searchCriteria, page: 1, per_page: 200) {[unowned self] response, error in
            if let response = response,
               let searchItems = response.items {
                let foundUsers = Converter.toFollowUsersDTOArray(searchItems)
                self.serachView.loadSearchResults(foundUsers)
            } else {
                self.serachView.showErrorMessage?("There were problems with search")
            }
        }
    }
}
