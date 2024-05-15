//
//  WeatherMock.swift
//  WeatherAPP
//
//  Created by Eljan on 15.05.24.
//

import Foundation
struct MockWeatherData {
    static let latitude: Double = 44.34
    static let longitude: Double = 11.0
    static let generationTimeMs: Double = 0.10097026824951172
    static let utcOffsetSeconds: Int = 0
    static let timezone: String = "GMT"
    static let timezoneAbbreviation: String = "GMT"
    static let elevation: Double = 720.0
    
    static let currentWeatherUnits = CurrentWeatherUnits(
        time: "iso8601",
        interval: "seconds",
        temperature: "°C",
        windspeed: "km/h",
        windDirection: "°",
        isDay: "",
        weatherCode: "wmo code"
    )
    
    static let currentWeather = CurrentWeather(
        time: "2024-05-15T15:30",
        interval: 900,
        temperature: 15.8,
        windspeed: 9.3,
        windDirection: 54,
        isDay: 1,
        weatherCode: 80
    )
}
