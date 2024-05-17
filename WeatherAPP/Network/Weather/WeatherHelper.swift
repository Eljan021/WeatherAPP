//
//  WeatherHelper.swift
//  WeatherAPP
//
//  Created by Eljan on 16.05.24.
//

import Foundation

enum WeatherHelper: String {
    case current = "/forecast?"
    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
