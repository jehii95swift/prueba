//
//  SelectCollectionViewCell.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureInfo(movie: SelectMovieOrTv) {
        if movie.originalName.isEmpty {
            titleLbl.text = movie.originalTitle
        } else {
            titleLbl.text = movie.originalName
        }

        let urlImage = "https://image.tmdb.org/t/p/w500\(movie.imageBig)"
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageImg.image = image
        }
        
    }

}
