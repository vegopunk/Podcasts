//
//  PlayerDetailsView.swift
//  Podcasts
//
//  Created by Денис Попов on 01.03.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    var episode : Episode! {
        didSet{
            titleLabel.text = episode.title
            
            guard let url = URL(string: episode.imageUrl ?? "") else {return}
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
}