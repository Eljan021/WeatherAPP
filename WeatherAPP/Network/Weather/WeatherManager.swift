//
//  WeatherManager.swift
//  WeatherAPP
//
//  Created by Eljan on 16.05.24.
//

import Foundation

class WeatherManager {
    
    static let shared = WeatherManager()
    
    func getTemperature(latitude:String, longitude:String, complete: @escaping((WeatherModel?, String?) -> Void)) {
        let url = "\(WeatherHelper.current.path)latitude=\(latitude)&longitude=\(longitude)&past_days=0&daily=temperature_2m_max,temperature_2m_min,precipitation_probability_mean&current_weather=true"
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
