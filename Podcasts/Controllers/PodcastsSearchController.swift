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
    
    
    let podcasts = [
        Podcast(name: "Some Podcast", artistName: "Denis Voong"),
        Podcast(name: "Lets Build that app", artistName: "Brian Voong"),
        Podcast(name: "vego.pro", artistName: "Brian Voong")
    ]
    
    let cellId = "cellId"
    
    //search controlelr
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        
        //добавление searchController
        navigationItem.searchController = searchController
        //всегда показывать строку поиска
        navigationItem.hidesSearchBarWhenScrolling = false
        //убирает title когда нажимаем на строку поиска
        searchController.dimsBackgroundDuringPresentation = false
        //получать текст из строки поиска
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        //дальше здесь будет реализован поиск с помощью Alamofire по itunes API
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        Alamofire.request(url).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("failed to contact yahoo" , err)
                return
            }
            guard let data = dataResponse.data else {return}
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "")
            
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
        
        cell.textLabel?.text = "\(podcast.name) \n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = 0
        
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
    
}
