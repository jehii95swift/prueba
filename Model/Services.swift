//
//  Services.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

final class Services {

    private let url: String = "https://api.themoviedb.org/3/"
    private let apiKey: String = "e2c0dde13d5b718de4f26a0f361c5cd2"
    private let language:String = "en_US"
    
    func request(type: ShowType, category: ShowCategory , completion: @escaping ([Movie]) -> ()) {
        
        let urlString = "\(url)\(type)/\(category)?api_key=\(apiKey)&language=\(language)"
        
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encoded) {
            Alamofire.request(url).responseJSON
                { response in
                    
                    if let json = response.result.value as? [String: Any] {
                        if let results = json["results"] as? [[String: Any]]{
                            let allmovies = Mapper<Movie>().mapArray(JSONArray: results)
                            completion(allmovies)
                        }
                    }
            }
        }
    }
}

