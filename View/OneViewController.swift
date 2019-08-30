//
//  OneViewController.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    
    
    @IBOutlet weak var upcomingBtn: UIButton!
    @IBOutlet weak var topRatedBtn: UIButton!
    @IBOutlet weak var popularBtn: UIButton!
    @IBOutlet weak var tvBtn: UIButton!
    @IBOutlet weak var moviesBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var busquedaTextField: UITextField!
    var controller = Controller()
    var allMovies: [SelectMovieOrTv] = []
    var type: String = "movie"
    var category: String = "popular"
    
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
        controller.request(type: type, category: category)
        register()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationMovies), name: NSNotification.Name(rawValue: "ya estan las peliculas"), object: nil)
    }
    
    @objc func notificationMovies() {
        self.allMovies = controller.getMovies()
        collectionView.reloadData()
        print("hey")
    }
    
    
    @IBAction func moviesPressed(_ sender: Any) {
        type = "movie"
        controller.request(type: type, category: category)
        
    }
    
    @IBAction func tvPressed(_ sender: Any) {
        type = "tv"
        controller.request(type: type, category: category)
    }
    
    @IBAction func popularBtnPressed(_ sender: Any) {
        category = "popular"
        controller.request(type: type, category: category)
    }
    
    @IBAction func topRatedBtnPressed(_ sender: Any) {
        category = "top_rated"
        controller.request(type: type, category: category)
    }
    
    @IBAction func upcomingBtnPressed(_ sender: Any) {
        if type == "tv" {
            upcomingBtn.setTitle("airing_today", for: .normal)
            category = "airing_today"
            
        }else {
            category = "upcoming"
            upcomingBtn.setTitle("upcoming", for: .normal)
        }
        controller.request(type: type, category: category)
    }
    
    @IBAction func texfieldChanged(_ sender: Any) {
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
    
    func register(){
        collectionView.register(UINib(nibName: "SelectCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectCollectionViewCell")
    }
    
 
}

extension OneViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
        let movies = allMovies[indexPath.row]
        cell.configureInfo(movies: movies)
        cell.configurarImage(movie: movies)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailMovieViewController()
        detailViewController.loadViewIfNeeded()
        let movies = allMovies[indexPath.row]
        detailViewController.configureDetail(movie: movies)
        detailViewController.configurarImagebig(movie: movies)
        detailViewController.configurarImage(movie: movies)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
extension OneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 150)
    }
}

