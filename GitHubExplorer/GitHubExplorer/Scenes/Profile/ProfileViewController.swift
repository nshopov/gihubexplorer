//
//  UserViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation
import UIKit
import GithubAPI

class ProfileViewController: UIViewController, ProfileView, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var tblRepositories: UITableView!
    @IBOutlet weak var btnFollowers: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var avatarImage: UIImageView!
    
    public var userData: UserDTO?
    
    private var profilePrsenter: ProfilePresenter!
    private var repositories: [RepositoryDTO]?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        self.tblRepositories.delegate = self
        self.tblRepositories.dataSource = self
        self.profilePrsenter = ProfilePresenter(self)
        self.profilePrsenter.load(userData)
        
        lblUsername.text = userData?.name
        
    }
    
    @IBAction func foolwingClicked(_ sender: Any) {
        performSegue(withIdentifier: "usersSegue", sender: self)
    }
    
    @IBAction func folloersClicked(_ sender: Any) {
        performSegue(withIdentifier: "usersSegue", sender: self)
    }
    
    private var currentRepositoryData: RepositoryDTO?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepository" {
            let repoVC = segue.destination as! RepositoryViewController
            
            if let currentRepositoryData = self.currentRepositoryData {
                repoVC.repositoryData = currentRepositoryData
            }
        }
    }
    
    // MARK: ProfileView protocol confirmation:
    func setFollowingAtributes(_ title: String, isEnabled: Bool) {
        self.btnFollowing.setTitle(title, for: .normal)
        self.btnFollowing.isEnabled = isEnabled
    }
    
    func setFollowersAtrributes(_ ttle: String, isEnabled: Bool) {
        self.btnFollowers.setTitle(title, for: .normal)
        self.btnFollowers.isEnabled = isEnabled
    }
    
    func setAvatarImage(imgData: Data) {
        self.avatarImage.image = UIImage(data: imgData)
    }
    
    
    func showErrorMessage(_ message: String) {
        self.showErrorMessage(message)
    }
    
    func loadRepositories(_ repositories: [RepositoryDTO]) {
        self.repositories = repositories
        self.tblRepositories.reloadData()
    }
    
    func showRepoDetail(_ repoData: RepositoryDTO) {
        self.currentRepositoryData = repoData
        performSegue(withIdentifier: "showRepository", sender: self)
    }
    
    // MARK: Table view
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: "repositoryProfileCell")
        
        if let repoItem = self.repositories?[indexPath.row] {
            cell.textLabel?.text = repoItem.fullName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let repoData = self.repositories?[indexPath.row] {
            self.profilePrsenter.onRepoSelected(repoData)
        }
        
    }
}
