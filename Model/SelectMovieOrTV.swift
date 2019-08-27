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
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        originalTitle  <- map["original_title"]
        image <- map["poster_path"]
    }
}
