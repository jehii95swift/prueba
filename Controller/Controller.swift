//
//  Controller.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation

class Controller {

    
    let services = Services()
    
    func request(type: String, category: String) {
        services.request(type: type, category: category)
    }
    func getMovies() -> [SelectMovieOrTv] {
        let getMovie = services.allmovies
        return getMovie
    }
    
    func search(texto: String) -> [SelectMovieOrTv] {
        let serchsMovies = services.search(text: texto)
        return serchsMovies
    }
}
