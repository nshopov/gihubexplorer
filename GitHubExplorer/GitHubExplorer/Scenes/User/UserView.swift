//
//  UserView.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation

protocol UserView: BaseView {
    func showErrorMessage(_ message: String)
}
