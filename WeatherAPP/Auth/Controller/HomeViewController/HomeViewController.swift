//
//  HomeViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    private (set) var weatherList: [WeatherModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.registerNib(with: "HomeCollectionViewCell")
        getList()
    }
    
    fileprivate func getList() {
        if let path = Bundle.main.path(forResource: "weatherJson", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                let weatherData = try JSONDecoder().decode(WeatherModel.self, from: jsonData)
                weatherList.append(weatherData)
                collection.reloadData()
            } catch {
                print("Error parsing JSON: \(error)")
            }
        } else {
            print("File not found")
        }
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherList.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let item = weatherList[indexPath.row]
        cell.headerItem = item
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: collectionView.frame.height )
    }
}

