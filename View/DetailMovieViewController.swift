//
//  DetailMovieViewController.swift
//  Netix
//
//  Created by Jenifer on 8/28/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

final class DetailMovieViewController: UIViewController {
    
    private let imageUrl:String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet private weak var titleMovieLbl: UILabel!
    @IBOutlet private weak var imageBigMovie: UIImageView!
    @IBOutlet private weak var overviewMovieLbl: UILabel!
    @IBOutlet private weak var smallTitleLbl: UILabel!
    @IBOutlet private weak var popularLbl: UILabel!
    @IBOutlet private weak var voteAverageLbl: UILabel!
    @IBOutlet private weak var dateMovieLbl: UILabel!
    @IBOutlet private weak var imageSmallMovie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
    }
    
    func configureDetail(movie: Movie) {
        configurarImage(movie: movie)
        configurarImagebig(movie: movie)
        
        overviewMovieLbl.text = movie.overview
        smallTitleLbl.text = "\(movie.title)"
        dateMovieLbl.text = "Release Date: \(movie.date)"
        popularLbl.text = "Popularity: \(movie.popular)"
        voteAverageLbl.text = "User Score: \(movie.voteAverage)%"
        smallTitleLbl.text = "\(movie.name)"
        dateMovieLbl.text = "Release Date: \(movie.dateTv)"
        
        if movie.originalTitle.isEmpty {
            titleMovieLbl.text = movie.originalName
        } else {
            titleMovieLbl.text = movie.originalTitle
        }
        if movie.name.isEmpty {
            smallTitleLbl.text = movie.title
        } else {
            smallTitleLbl.text = movie.name
        }
    }
}

private extension DetailMovieViewController {
    
    func configurarImagebig(movie: Movie) {
        let urlImage = "\(imageUrl)\(movie.imageBig)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageBigMovie.image = image
            imageBigMovie.hero.id = "movieImage"
        }
    }
    
    func configurarImage(movie: Movie) {
        let urlImage = "\(imageUrl)\(movie.image)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageSmallMovie.image = image
        }
    }
}
