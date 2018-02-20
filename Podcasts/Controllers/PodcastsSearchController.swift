//
//  PodcastSearchController.swift
//  Podcasts
//
//  Created by Денис Попов on 15.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController : UITableViewController,UISearchBarDelegate {
    
    var podcasts = [
        Podcast(trackName: "Some Podcast", artistName: "Denis Voong"),
        Podcast(trackName: "Lets Build that app", artistName: "Brian Voong"),
        Podcast(trackName: "vego.pro", artistName: "Brian Voong")
    ]
    
    let cellId = "cellId"
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        //всегда показывать строку поиска
        navigationItem.hidesSearchBarWhenScrolling = false
        //убирает title когда нажимаем на строку поиска
        searchController.dimsBackgroundDuringPresentation = false
        //получать текст из строки поиска
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "") \n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        return cell
    }
    
}
