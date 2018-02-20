//
//  APIService.swift
//  Podcasts
//
//  Created by Денис Попов on 20.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    //singleton
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    static let shared = APIService()
    
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
