//
//  EpisodesController.swift
//  Podcasts
//
//  Created by Денис Попов on 23.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit

class EpisodesController: UITableViewController {
    
    var podcast : Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    fileprivate let cellId = "cellId"
    
    struct Episode {
        let title : String
    }

    var episodes = [
            Episode(title: "First episode"),
            Episode(title: "Second episode"),
            Episode(title: "Third episode")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    //MARK:- Setup Work
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = self.episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
    
    
}
