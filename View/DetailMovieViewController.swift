//
//  DetailMovieViewController.swift
//  Netix
//
//  Created by Jenifer on 8/28/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var titleMovieLbl: UILabel!
    @IBOutlet weak var imageBigMovie: UIImageView!
    @IBOutlet weak var overviewMovieLbl: UILabel!
    @IBOutlet weak var smallTitleLbl: UILabel!
    @IBOutlet weak var popularLbl: UILabel!
    @IBOutlet weak var voteAverageLbl: UILabel!
    @IBOutlet weak var dateMovieLbl: UILabel!
    @IBOutlet weak var imageSmallMovie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func configureDetail(movie: SelectMovieOrTv) {
        titleMovieLbl.text = movie.originalTitle
        overviewMovieLbl.text = movie.overview
        smallTitleLbl.text = movie.title
        dateMovieLbl.text = movie.date
        popularLbl.text = "\(movie.popular)"
        voteAverageLbl.text = "\(movie.voteAverage)"
        titleMovieLbl.text = movie.originalName
        titleMovieLbl.text = movie.name
        dateMovieLbl.text = movie.dateTv
        
        
    }
    
    func configurarImage(movie: SelectMovieOrTv) {
        let urlImage = "https://image.tmdb.org/t/p/w500\(movie.image)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageSmallMovie.image = image
        }
    }
    
    func configurarImagebig(movie: SelectMovieOrTv) {
        let urlImage = "https://image.tmdb.org/t/p/w500\(movie.imageBig)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageBigMovie.image = image
        }
    }

}
