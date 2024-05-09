//
//  FooterCell.swift
//  WeatherAPP
//
//  Created by Eljan on 09.05.24.
//

import UIKit

class FooterCell: UICollectionViewCell {
    @IBOutlet weak var footerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        footerCollectionView.register(UINib(
            nibName: "CustomCell",
            bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        footerCollectionView.delegate = self
        footerCollectionView.dataSource = self
    }

}

extension FooterCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 44 )
        }

}
