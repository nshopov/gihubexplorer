//
//  SearchView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 31.05.22.
//

import Foundation

public protocol SearchView: BaseView {
    func loadSearchResults(_ items: [FollowUserDTO])
}
