//
//  RepositoryViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 30.05.22.
//

import Foundation
import UIKit
             
public class RepositoryViewController: UIViewController {
    public var repositoryData: RepositoryDTO?
    
    @IBOutlet weak var lblStarred: UILabel!
    @IBOutlet weak var txtFull: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblForks: UILabel!
    
    public override func viewDidLoad() {
        if let repositoryData = repositoryData {
            lblName.text = repositoryData.name
        }
    }
}
