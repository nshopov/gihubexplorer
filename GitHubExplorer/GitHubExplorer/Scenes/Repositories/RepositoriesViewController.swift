//
//  RepositoriesViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 28.05.22.
//

import Foundation
import UIKit

public class RepositroiesViewController: UITableViewController, RepositoriesView {
    private var reposPresenter: RepositoriesPresenter!
    
    public override func viewDidLoad() {
        self.reposPresenter = RepositoriesPresenter(self)
    }
    
}
