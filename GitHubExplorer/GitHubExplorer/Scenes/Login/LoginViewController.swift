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
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let username = self.tbUsername.text, !username.isEmpty,
              let password = self.tbPassword.text, !password.isEmpty else {
            UIUtils.showError(self, "Please provide username and/or passowrd.")
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
    
    func loginCompleted(_ userData: UserDTO) {
        // navigate to the user controller
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let userViewController = storyBoard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        
        userViewController.userData = userData
        
        UIApplication.shared.windows.first?.rootViewController = userViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
