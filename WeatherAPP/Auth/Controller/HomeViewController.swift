//
//  HomeViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.registerNib(with: "HomeCollectionViewCell")
        collection.registerNib(with: "FooterCell")
    }
    


}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            return cell
        } else if indexPath.row == 1 { 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterCell
            return cell
        }; return UICollectionViewCell() 
    }
        
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {  if indexPath.row == 0 {
            return CGSize(width:collectionView.frame.width, height: collectionView.frame.height * 0.5)
        }
            else {
                return CGSize(width:collectionView.frame.width, height: 300 )
            }
        }
    }
    

