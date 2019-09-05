//
//  
//  Netix
//
//  Created by Jenifer on 8/27/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import ObjectMapper

final class Movie: Mappable {
    
    var originalTitle: String = ""
    var image: String = ""
    var imageBig: String = ""
    var overview: String = ""
    var title: String = ""
    var popular: Int = 0
    var voteAverage: Int = 0
    var date: String = ""
    var originalName: String = ""
    var name: String = ""
    var dateTv: String = ""
    var trueName :String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        image <- map["poster_path"]
        imageBig <- map["backdrop_path"]
        overview  <- map["overview"]
        popular <- map["popularity"]
        voteAverage  <- map["vote_average"]
        date <- map["release_date"]
        dateTv <- map["first_air_date"]
        originalTitle  <- map["original_title"]
        title <- map["title"]
        originalName <- map["original_name"]
        name <- map["name"]
        
        if !originalTitle.isEmpty {
            trueName = originalTitle
        } else {
            trueName = originalName
        }
    }
}

