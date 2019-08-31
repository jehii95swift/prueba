//
//  OneViewController.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var upcomingBtn: UIButton! {
        didSet {
            upcomingBtn.layer.borderColor = UIColor.black.cgColor
            upcomingBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var topRatedBtn: UIButton! {
        didSet {
            topRatedBtn.layer.borderColor = UIColor.black.cgColor
            topRatedBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var popularBtn: UIButton! {
        didSet {
            
            popularBtn.layer.borderColor = UIColor.white.cgColor
            popularBtn.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var tvBtn: UIButton! {
        didSet {
            tvBtn.layer.borderColor = UIColor.black.cgColor
            tvBtn.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var moviesBtn: UIButton! {
        didSet {
            moviesBtn.layer.borderColor = UIColor.white.cgColor
            moviesBtn.layer.borderWidth = 1
        }
    }
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
        view.backgroundColor = .black
        
        
        
    }
    
    @objc func notificationMovies() {
        self.allMovies = controller.getMovies()
        collectionView.reloadData()
        print("hey")
    }
    
    
    @IBAction func moviesPressed(_ sender: Any) {
        
        if type != "movie" {
            type = "movie"
            upcomingBtn.setTitle("UpComing", for: .normal)
            controller.request(type: type, category: category)
            moviesBtn.layer.borderColor = UIColor.white.cgColor
            tvBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    @IBAction func tvPressed(_ sender: Any) {
        if type != "tv" {
            type = "tv"
            upcomingBtn.setTitle("Airing_today", for: .normal)
            controller.request(type: type, category: category)
            tvBtn.layer.borderColor = UIColor.white.cgColor
            moviesBtn.layer.borderColor = UIColor.black.cgColor
        }
        
    }
    
    @IBAction func popularBtnPressed(_ sender: Any) {
        if category != "popular" {
            category = "popular"
            controller.request(type: type, category: category)
            popularBtn.layer.borderColor = UIColor.white.cgColor
            topRatedBtn.layer.borderColor = UIColor.black.cgColor
            upcomingBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBAction func topRatedBtnPressed(_ sender: Any) {
        if category != "top_rated" {
            category = "top_rated"
            controller.request(type: type, category: category)
            topRatedBtn.layer.borderColor = UIColor.white.cgColor
            popularBtn.layer.borderColor = UIColor.black.cgColor
            upcomingBtn.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBAction func upcomingBtnPressed(_ sender: Any) {
        if category != "upcoming" {
            category = "upcoming"
            controller.request(type: type, category: category)
            upcomingBtn.layer.borderColor = UIColor.white.cgColor
            popularBtn.layer.borderColor = UIColor.black.cgColor
            topRatedBtn.layer.borderColor = UIColor.black.cgColor
            
        }
    }
    
    @IBAction func texfieldChanged(_ sender: Any) {
        let textSearch = textField.text ?? ""
        let arraySerch = controller.search(texto: textSearch)
        allMovies  = arraySerch
        collectionView.reloadData()
        
        
        
       
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
        cell.configureInfo(movie: movies)

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
        return CGSize(width: 410, height: 250)
    }
}

