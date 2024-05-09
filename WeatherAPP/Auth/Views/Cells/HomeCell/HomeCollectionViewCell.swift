//
//  HomeCollectionViewCell.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollection.register(UINib(
            nibName: "HeaderCell",
            bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        homeCollection.delegate = self
        homeCollection.dataSource = self
  
    }

}
extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
//        cell.favoriteButtonClicked = favoriteButtonClicked
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width:collectionView.frame.width, height: collectionView.frame.height )
        }

}
