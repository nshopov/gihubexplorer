//
//  UsersViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation
import UIKit

public class UsersViewController: UITableViewController, UsersView {
    @IBOutlet weak var tblUsers: UITableView!
    
    private var usersPresenter: UsersPresenter!
    private var users: [FollowUserDTO]?
    
    public override func viewDidLoad() {
        // bootstrap the presenter
        self.usersPresenter = UsersPresenter(self)
        self.usersPresenter.getFollwingUsers()
    }
    
    public func showErrorMessage(_ message: String) {
        self.showError(message)
    }
    
    public func loadUsers(_ users: [FollowUserDTO]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    public func showRepositoryDetailFor(_ user: FollowUserDTO) {
        
    }
    
    public func showLoadingStatus() {
            
    }
    
    public func hideLoadingStatus() {
        
    }
    
    
    // MARK: Table view protocol confirmation
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "usersCell")
        
        if let user = self.users?[indexPath.row] {
            cell.textLabel?.text = user.login
            if let imgUrl = URL(string: user.avatarUrl),
               let data = try? Data(contentsOf: imgUrl) {
                cell.imageView?.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = self.users?[indexPath.row] {
            self.usersPresenter.onSelect(user)
        }
        
        
    }
}
