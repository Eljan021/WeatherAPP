//
//  HomeViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    private (set) var weatherList: [WeatherModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.registerNib(with: "HomeCollectionViewCell")
        getList()
    }
    
    fileprivate func getList() {
        weatherList = [
            WeatherModel(
                latitude: MockWeatherData.latitude,
                longitude: Int(MockWeatherData.longitude),
                generationTimeMS: MockWeatherData.generationTimeMs,
                UTCOffsetSeconds: MockWeatherData.utcOffsetSeconds,
                timezone: MockWeatherData.timezone,
                timezoneAbbreviation: MockWeatherData.timezoneAbbreviation,
                elevation: Int(MockWeatherData.elevation),
                currentWeatherUnits: MockWeatherData.currentWeatherUnits,
                currentWeather: MockWeatherData.currentWeather
            ),
            WeatherModel(
                latitude: MockWeatherData.latitude,
                longitude: Int(MockWeatherData.longitude),
                generationTimeMS: MockWeatherData.generationTimeMs,
                UTCOffsetSeconds: MockWeatherData.utcOffsetSeconds,
                timezone: MockWeatherData.timezone,
                timezoneAbbreviation: MockWeatherData.timezoneAbbreviation,
                elevation: Int(MockWeatherData.elevation),
                currentWeatherUnits: MockWeatherData.currentWeatherUnits,
                currentWeather: MockWeatherData.currentWeather
            ),
            WeatherModel(
                latitude: MockWeatherData.latitude,
                longitude: Int(MockWeatherData.longitude),
                generationTimeMS: MockWeatherData.generationTimeMs,
                UTCOffsetSeconds: MockWeatherData.utcOffsetSeconds,
                timezone: MockWeatherData.timezone,
                timezoneAbbreviation: MockWeatherData.timezoneAbbreviation,
                elevation: Int(MockWeatherData.elevation),
                currentWeatherUnits: MockWeatherData.currentWeatherUnits,
                currentWeather: MockWeatherData.currentWeather
            )
        ]
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList?.count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        guard let item = weatherList?[indexPath.row] else {return UICollectionViewCell()}
        cell.headerItem = item
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: collectionView.frame.height )
    }
}

