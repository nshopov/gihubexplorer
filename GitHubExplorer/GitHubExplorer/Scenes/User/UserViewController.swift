//
//  UserViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 25.05.22.
//

import Foundation
import UIKit
import GithubAPI

class UserViewController: UIViewController, UserView {
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var tblRepositories: UITableView!
    @IBOutlet weak var btnFollowers: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var avatarImage: UIImageView!
    
    public var userData: UserDTO?
    
    private var userPrsenter: UserPresenter!
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        self.userPrsenter = UserPresenter(self)
        
        lblUsername.text = userData?.name
        
        if let imgUrl = URL(string: userData?.avatarUrl ?? ""),
           let data = try? Data(contentsOf: imgUrl) {
          self.avatarImage.image = UIImage(data: data)
        }
        
        if self.userData?.followers == 0 {
            btnFollowers.isEnabled = false
        }
        
        if self.userData?.following == 0 {
            btnFollowing.isEnabled = false
        }
        
        btnFollowing.setTitle("\(userData?.following ?? 0) Following", for: .normal)
        btnFollowers.setTitle("\(userData?.followers ?? 0) Followers", for: .normal)
        
    }
    
    @IBAction func foolwingClicked(_ sender: Any) {
        performSegue(withIdentifier: "usersSegue", sender: self)
    }
    
    @IBAction func folloersClicked(_ sender: Any) {
        performSegue(withIdentifier: "usersSegue", sender: self)
    }
    
    func showErrorMessage(_ message: String) {
        self.showErrorMessage(message)
    }
}
