//
//  MoreCollectionViewCell.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var moreCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        moreCollection.register(UINib(nibName: "MoreHeaderCell", bundle: nil), forCellWithReuseIdentifier: "MoreHeaderCell"))
        moreCollection.delegate = self
        moreCollection.dataSource = self
        moreCollection.registerNib(with: "MoreHeaderCell")
    }

}

extension MoreCollectionViewCell:  UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreHeaderCell", for: indexPath) as! MoreHeaderCell
        return cell
    }
    
    
}
