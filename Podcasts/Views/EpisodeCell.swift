//
//  EpisodeCell.swift
//  Podcasts
//
//  Created by Денис Попов on 28.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    var episode: Episode! {
        didSet{
            pubDateLabel.text = episode.pubDate.description
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd , yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
        }
    }
    
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet{
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet{
            descriptionLabel.numberOfLines = 2
        }
    }
}
