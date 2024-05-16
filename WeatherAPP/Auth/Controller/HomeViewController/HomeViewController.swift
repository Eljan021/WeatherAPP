//
//  HomeViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 08.05.24.
//
protocol HomeProtocol{
    func error(errorMessage: String )
    func success()
}

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    private var templist: WeatherModel?
     var weatherList: [WeatherProtocol] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.registerNib(with: "HomeCollectionViewCell")
//        getList()
        getListrequest()
    }
    var succsesCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    
    func getWeatherList() -> [WeatherProtocol]{
        return weatherList
    }
    
    fileprivate func getListrequest(){
        WeatherManager.shared.getTemperatureList { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.templist = responseData
//                self.weatherList = responseData.results ?? []
                self.succsesCallback?()
            }
        }
        
    }
    
    fileprivate func getList() {
        //api'a request atib gelen response parse edib weather list'e appenden edeceksen
        if let path = Bundle.main.path(forResource: "weatherJson", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                let weatherData = try JSONDecoder().decode(WeatherModel.self, from: jsonData)
//                weatherList.append(weatherData)
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
//        cell.headerItem = item
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: collectionView.frame.height )
    }
}

