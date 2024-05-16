//
//  WeatherHelper.swift
//  WeatherAPP
//
//  Created by Eljan on 16.05.24.
//

import Foundation

enum WeatherHelper: String {
    case hourly = "https://api.open-meteo.com/v1/forecast?latitude=40.425&longitude=49.7956&hourly=temperature_2m"
    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
