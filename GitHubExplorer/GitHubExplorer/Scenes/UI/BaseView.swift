//
//  BaseViewInterface.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation
@objc public protocol BaseView {
    @objc optional func showErrorMessage(_ message: String)
    @objc optional func showLoadingStatus()
    @objc optional func hideLoadingStatus()
}
