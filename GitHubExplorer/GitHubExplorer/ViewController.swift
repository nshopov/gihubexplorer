//
//  ViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 22.05.22.
//

import UIKit
import GithubAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let authentication = BasicAuthentication(username: "nshopov", password: "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")
        UserAPI(authentication: authentication).getUser { (response, error) in
            if let response = response {
                print(response)
            } else {
                print(error ?? "")
            }
        }
    }


}

