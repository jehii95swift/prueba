//
//  OneViewController.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var busquedaTextField: UITextField!
    var controller = Controller()
    var allMovies: [SelectMovieOrTv] = []
    
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
        controller.request()
        register()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationMovies), name: NSNotification.Name(rawValue: "ya estan las peliculas"), object: nil)
    }
    
    @objc func notificationMovies() {
        self.allMovies = controller.getMovies()
        collectionView.reloadData()
        print("hey")
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
        return cell
    }
}
extension OneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 150)
    }
}

