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
    
    func request() {
        services.request()
    }
    func getMovies() -> [SelectMovieOrTv] {
        let getMovie = services.allmovies
        return getMovie
    }
    
}
