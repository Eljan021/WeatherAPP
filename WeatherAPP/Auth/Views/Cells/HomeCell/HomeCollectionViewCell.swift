//
//  HomeCollectionViewCell.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeCollection: UICollectionView!
    var headerItem: WeatherModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollection.register(UINib(
            nibName: "HeaderCell",
            bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        homeCollection.registerNib(with: "FooterCell")
        homeCollection.delegate = self
        homeCollection.dataSource = self
  
    }

}
extension HomeCollectionViewCell: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            guard let item = headerItem else {return UICollectionViewCell()}
            cell.configureView(data: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterCell
            let time = headerItem?.daily?.time?[indexPath.row] ?? ""
            let percent = "\(headerItem?.daily?.precipitationProbabilityMean?[indexPath.row] ?? 0)%"
            let morning = "\(headerItem?.daily?.temperature2MMax?[indexPath.row] ?? 0)°C"
            let night = "\(headerItem?.daily?.temperature2MMax?[indexPath.row] ?? 0)°C"
            cell.configureCell(time: time, percent: percent, morningTemp: morning, nightTemp: night)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width:collectionView.frame.width,
            height:  indexPath.section == 0 ? collectionView.frame.height * 0.5 : 44 )
        }
}
