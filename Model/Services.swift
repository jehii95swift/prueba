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
    
    func request() {
        Alamofire.request("https://api.themoviedb.org/4/list/1?api_key=e2c0dde13d5b718de4f26a0f361c5cd2").responseJSON
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

