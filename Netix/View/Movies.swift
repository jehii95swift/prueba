//
//  Movies.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit
import Hero

final class Movies: UICollectionViewCell {
    
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var imageImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.hero.isEnabled = true
    }
    
    func configureInfo(movie: Movie) {
        if movie.trueName.isEmpty {
            titleLbl.text = movie.trueName
        } else {
            titleLbl.text = movie.trueName
        }

        let urlImage = "https://image.tmdb.org/t/p/w500\(movie.imageBig)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageImg.image = image
            imageImg.hero.id = "movieImage"
        }
        
    }

}
