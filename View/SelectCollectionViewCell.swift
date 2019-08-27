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
    func configureInfo(movies: SelectMovieOrTv) {
        titleLbl.text = movies.originalTitle
        
    }
    func configurarImage(urlImageMovie: String) {
        let url = URL(string: urlImageMovie)
        let data = try? Data(contentsOf: url!)
        
        if let data = data {
            let image = UIImage(data: data)
            imageImg.image = image
        }
        
    }

}
