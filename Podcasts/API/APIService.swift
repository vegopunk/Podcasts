//
//  APIService.swift
//  Podcasts
//
//  Created by Денис Попов on 20.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService {
    //singleton
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    static let shared = APIService()
    
    func fetchEpisodes(feedUrl : String , completionHandler : @escaping ([Episode]) -> ()) {
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string: secureFeedUrl) else {return}
        
        
        DispatchQueue.global(qos: .background).async {
            let parser = FeedParser(URL: url)
            parser?.parseAsync(result: { (result) in
                print("Successfully parse feed " , result.isSuccess)
                if let err =  result.error {
                    print("Failed to parse XML feed:" , err)
                    return
                }
                guard let feed = result.rssFeed else {return}
                let episodes = feed.toEpisodes()
                completionHandler(episodes)
            })
        }
    }
    
    func fetchPodcasts(searchText : String , completionHandler : @escaping ([Podcast]) -> ()) {
//        print("Searching for podcasts...")
        
        let parameters = ["term" : searchText , "media" : "podcast"]
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("failed to contact yahoo" , err)
                return
            }
            guard let data = dataResponse.data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                
                completionHandler(searchResult.results)
//                self.podcasts = searchResult.results
//                self.tableView.reloadData()
            }catch let decodeErr {
                print("Failed to decode : " , decodeErr)
            }
        }
    }
    
    
    
    
    struct SearchResults : Decodable {
        let resultCount : Int
        let results : [Podcast]
    }
    
}
