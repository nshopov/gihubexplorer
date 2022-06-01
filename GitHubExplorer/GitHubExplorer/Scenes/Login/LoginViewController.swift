//
//  LoginController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 24.05.22.
//

import Foundation
import UIKit
import GithubAPI

public class LoginViewController: UIViewController, LoginView {
    
    @IBOutlet weak var tbUsername: UITextField!
    @IBOutlet weak var tbPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    private var loginPresenter: LoginPresenter!
    
    public override func viewDidLoad() {
        // Wire up presenter
        self.loginPresenter = LoginPresenter(self)
        self.loginPresenter.present()
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let username = self.tbUsername.text, !username.isEmpty,
              let password = self.tbPassword.text, !password.isEmpty else {
            self.showError("Please provide username and/or passowrd.")
            return
        }
        
        self.loginPresenter.doLogin(username, password)
    }
    
    // MARK: LoginView methods
    func showLoadingStatus() {
        // Show loading status
    }
    
    func hideLoadingStatus() {
        // Hide loading status
    }
    
    func showErrorMessage(_ message: String) {
        self.showError(message)
    }
    
    func clear() {
        self.tbPassword.text = ""
        self.tbUsername.text = ""
    }
        
    
    func loginCompleted(_ userData: UserDTO) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let mainTabbarController = storyBoard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
        
        let profileNavBar = mainTabbarController.viewControllers![0] as! UINavigationController
        let profileController = profileNavBar.viewControllers[0] as! ProfileViewController
        profileController.userData = userData
        
        
        UIApplication.shared.windows.first?.rootViewController = mainTabbarController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
