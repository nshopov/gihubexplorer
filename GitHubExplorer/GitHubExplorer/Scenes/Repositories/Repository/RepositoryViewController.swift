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
    
    @IBOutlet weak var txtFull: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblWatchers: UILabel!
    @IBOutlet weak var lblSubscribers: UILabel!
    
    public override func viewDidLoad() {
        if let repositoryData = repositoryData {
            lblName.text = repositoryData.name
            txtFull.text = repositoryData.fullName
            lblWatchers.text = "\(repositoryData.watchersCount ?? 0) Watchers"
            lblSubscribers.text = "\(repositoryData.subscribersCount ?? 0) Subscribers"
        }
    }
}
