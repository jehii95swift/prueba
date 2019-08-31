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

class Services {
    var allmovies:[SelectMovieOrTv] = []
    
    func search(text: String) -> [SelectMovieOrTv] {
        let results = allmovies.filter { $0.trueName.contains(text) }
        return results
    }
    
    func request(type: String, category: String) {
        
        let urlString = "https://api.themoviedb.org/3/\(type)/\(category)?api_key= e2c0dde13d5b718de4f26a0f361c5cd2&language=en_US"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded) {
            Alamofire.request(url).responseJSON
                { response in
                    
                    if let json = response.result.value as? [String: Any] {
                        if let results = json["results"] as? [[String: Any]]{
                            self.allmovies = Mapper<SelectMovieOrTv>().mapArray(JSONArray: results)
                            print("lol'0")
                        }
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ya estan las peliculas"), object: nil)
                    }
                    print ("respuesta")
            }
        }
        
        
    }
}

