//
//  OneViewController.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit
import Hero

enum ShowType {
    case movie
    case tv
}
enum ShowCategory {
    case popular
    case top_rated
    case upcoming
    case airing_today
}

final class OneViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var busquedaTextField: UITextField!
    @IBOutlet private weak var textField: UITextField!
    
    @IBOutlet private weak var upcomingBtn: UIButton! {
        didSet {
            upcomingBtn.layer.borderColor = UIColor.black.cgColor
            upcomingBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet private weak var topRatedBtn: UIButton! {
        didSet {
            topRatedBtn.layer.borderColor = UIColor.black.cgColor
            topRatedBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet private weak var popularBtn: UIButton! {
        didSet {
            
            popularBtn.layer.borderColor = UIColor.white.cgColor
            popularBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet private weak var tvBtn: UIButton! {
        didSet {
            tvBtn.layer.borderColor = UIColor.black.cgColor
            tvBtn.layer.borderWidth = 1
        }
    }
    
    @IBOutlet private weak var moviesBtn: UIButton! {
        didSet {
            moviesBtn.layer.borderColor = UIColor.white.cgColor
            moviesBtn.layer.borderWidth = 1
        }
    }
    
    private let controller = Controller()
    private var allMovies: [Movie] = []
    private var tempMovies: [Movie] = []
    private var type: ShowType = .movie
    private var category: ShowCategory = .popular
    
    init() {
        super.init(nibName: "OneViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        requestMovies()
        register()

        view.backgroundColor = .black
        self.hero.isEnabled = true
    }
    func requestMovies() {
        controller.request(type: type, category: category, completion: { movies in
            self.allMovies = movies
            self.tempMovies = movies
            self.collectionView.reloadData()
        })

    }
    
    @IBAction private func moviesPressed(_ sender: Any) {
        guard type != .movie else {
            return
        }
        if category == .airing_today {
            category = .upcoming
        }
        
        type = .movie
        upcomingBtn.setTitle("UpComing", for: .normal)
        requestMovies()
        moviesBtn.layer.borderColor = UIColor.white.cgColor
        tvBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction private func tvPressed(_ sender: Any) {
        guard type != .tv else {
            return
        }
        if category == .upcoming {
            category = .airing_today
        }
        type = .tv
        upcomingBtn.setTitle("Airing_today", for: .normal)
        requestMovies()
        tvBtn.layer.borderColor = UIColor.white.cgColor
        moviesBtn.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction private func popularBtnPressed(_ sender: Any) {
        guard category != .popular else {
            return
        }

        category = .popular
        requestMovies()
        popularBtn.layer.borderColor = UIColor.white.cgColor
        topRatedBtn.layer.borderColor = UIColor.black.cgColor
        upcomingBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction private func topRatedBtnPressed(_ sender: Any) {
        guard category != .top_rated else {
            return
        }
        
        category = .top_rated
        requestMovies()
        topRatedBtn.layer.borderColor = UIColor.white.cgColor
        popularBtn.layer.borderColor = UIColor.black.cgColor
        upcomingBtn.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction private func upcomingBtnPressed(_ sender: Any) {
        guard category != .upcoming else {
            return
        }
    
        if type == .tv {
            category = .airing_today
        } else {
            category = .upcoming
        }
        requestMovies()
        upcomingBtn.layer.borderColor = UIColor.white.cgColor
        popularBtn.layer.borderColor = UIColor.black.cgColor
        topRatedBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction private func texfieldChanged(_ sender: Any) {
        
        let textSearch = textField.text ?? ""
        let arraySerch = search(text: textSearch)
        tempMovies = arraySerch
        collectionView.reloadData()

    }
    
    private func search(text: String) -> [Movie] {
        let results = allMovies.filter { $0.trueName.contains(text) }
        return results
    }

    private func register(){
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
}

extension OneViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let movies = tempMovies[indexPath.row]
        cell.configureInfo(movie: movies)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailMovieViewController()
        detailViewController.loadViewIfNeeded()
        let movie = tempMovies[indexPath.row]
        detailViewController.configureDetail(movie: movie)
    
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
extension OneViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 410, height: 250)
    }
}

