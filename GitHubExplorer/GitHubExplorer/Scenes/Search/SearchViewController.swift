//
//  SearchViewController.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 31.05.22.
//

import Foundation
import UIKit

public class SearchViewController: UIViewController,
                                    SearchView,
                                    UITableViewDelegate,
                                    UITableViewDataSource {
    
    private var searchPresenter: SearchPresenter!
    private var searchItems: [FollowUserDTO] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblResults: UITableView!
    
    
    public override func viewDidLoad() {
        self.searchPresenter = SearchPresenter(self)
        self.definesPresentationContext = true
    }
    
    public func loadSearchResults(_ items: [FollowUserDTO]) {
        self.searchItems = items
        self.tblResults.reloadData()
    }
    
    public func showErrorMessage(_ message: String) {
        self.clearTable()
        self.showError(message)
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "searchCell")
        
        let user = self.searchItems[indexPath.row]
        cell.textLabel?.text = user.login
        if let imgUrl = URL(string : user.avatarUrl),
           let data = try? Data(contentsOf: imgUrl) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        
        return cell
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReposSegue" {
            let destinationVC = segue.destination as! RepositoriesViewController
            destinationVC.followUser = self.selectedItem
        }
    }
    
    
    var selectedItem: FollowUserDTO?
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = self.searchItems[indexPath.row]
        
        performSegue(withIdentifier: "showReposSegue", sender: self)
    }
    
    private func clearTable() {
        self.searchItems = []
        self.tblResults.reloadData()
    }
}



extension SearchViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = self.searchBar.text {
            self.searchPresenter.search(searchText)
        }
    }
}


