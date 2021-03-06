//
//  Podcast.swift
//  Podcasts
//
//  Created by Денис Попов on 15.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import Foundation


struct Podcast : Decodable {
    
    var trackName : String?
    var artistName : String?
    var artworkUrl100 : String?
    var trackCount : Int?
    var feedUrl : String?
    
}
