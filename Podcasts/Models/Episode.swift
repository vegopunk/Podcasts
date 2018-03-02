//
//  Episode.swift
//  Podcasts
//
//  Created by Денис Попов on 28.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import Foundation
import FeedKit


struct Episode {
    let title : String
    let pubDate : Date
    let description : String
    
    let author : String
    let streamUrl : String
    var imageUrl : String?
    
    
    init(feedItem : RSSFeedItem) {
        
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
