//
//  RepositoriesViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 28.05.22.
//

import Foundation
import UIKit

public class RepositoriesViewController: UITableViewController, RepositoriesView {
    private var repositoriesData: [RepositoryDTO] = []
    private var reposPresenter: RepositoriesPresenter!
    private var currentRepositoryData: RepositoryDTO?
    
    public var followUser: FollowUserDTO?
    
    public override func viewDidLoad() {
        self.reposPresenter = RepositoriesPresenter(self)
        if let followUser = self.followUser {
            self.reposPresenter.getRepositoriesFor(followUser.login)
        }
        
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepoSegue" {
            let repoVC = segue.destination as! RepositoryViewController
            
            if let currentRepositoryData = self.currentRepositoryData {
                repoVC.repositoryData = currentRepositoryData
            }
        }
    }
    
    // MARK: RepositriesView protocol confirmation
    public func showErrorMessage(_ message: String) {
        self.showError(message)
    }
    
    public func loadRepositories(_ repositories: [RepositoryDTO]?) {
        if let repositories = repositories {
            self.repositoriesData = repositories
            self.tableView.reloadData()
        }
        
    }
    
    public func showRepositoryDetail(_ repository: RepositoryDTO) {
        self.currentRepositoryData = repository
        performSegue(withIdentifier: "showRepoSegue", sender: self)
    }
    
    
    
    // MARK: Tableview
    public override func tableView(_ tableView: UITableView,
                                   numberOfRowsInSection section: Int) -> Int {self.repositoriesData.count}
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "repositoriesCell")
        let repo = self.repositoriesData[indexPath.row]
        cell.textLabel?.text = repo.name
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = self.repositoriesData[indexPath.row]
        self.reposPresenter.onSelectRepository(repo)
    }
}
