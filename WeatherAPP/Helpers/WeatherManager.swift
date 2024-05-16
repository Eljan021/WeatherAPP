//
//  WeatherManager.swift
//  WeatherAPP
//
//  Created by Eljan on 16.05.24.
//

import Foundation

class WeatherManager {
    
    static let shared = WeatherManager()
    
    func getTemperatureList(complete: @escaping((WeatherModel?, String?) -> Void)){
        let url = "\(WeatherHelper.hourly.path)"
        NetworkManager.shared.request(
            type: WeatherModel.self,
            url: url,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
