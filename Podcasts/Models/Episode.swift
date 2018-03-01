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
    var imageUrl : String?
    
    
    init(feedItem : RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
        
    }
}
