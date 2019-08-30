//
//  
//  Netix
//
//  Created by Jenifer on 8/27/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import ObjectMapper

class SelectMovieOrTv: Mappable {
    
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
    
    

    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        originalTitle  <- map["original_title"]
        image <- map["poster_path"]
        imageBig <- map["backdrop_path"]
        overview  <- map["overview"]
        title <- map["title"]
        popular <- map["popularity"]
        voteAverage  <- map["vote_average"]
        date <- map["release_date"]
        originalName <- map["original_name"]
        name <- map["name"]
        dateTv <- map["first_air_date"]
        
        
    }
}
 /*
"vote_count": 11545,
"popularity": 14.325,
"id": 100402,
"video": false,
"media_type": "movie",
"vote_average": 7.7,
"title": "Captain America: The Winter Soldier",
"release_date": "2014-04-04",
"original_language": "en",
"original_title": "Captain America: The Winter Soldier",
"genre_ids": [
28,
12,
878
],
"backdrop_path": "/4qfXT9BtxeFuamR4F49m2mpKQI1.jpg",
"adult": false,
"overview": "After the cataclysmic events in New York with The Avengers, Steve Rogers, aka Captain America is living quietly in Washington, D.C. and trying to adjust to the modern world. But when a S.H.I.E.L.D. colleague comes under attack, Steve becomes embroiled in a web of intrigue that threatens to put the world at risk. Joining forces with the Black Widow, Captain America struggles to expose the ever-widening conspiracy while fighting off professional assassins sent to silence him at every turn. When the full scope of the villainous plot is revealed, Captain America and the Black Widow enlist the help of a new ally, the Falcon. However, they soon find themselves up against an unexpected and formidable enemy—the Winter Soldier.",
"poster_path": "/5TQ6YDmymBpnF005OyoB7ohZps9.jpg"

*/
