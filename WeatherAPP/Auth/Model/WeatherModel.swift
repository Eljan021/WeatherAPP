//
//  WeatherModel.swift
//  WeatherAPP
//
//  Created by Eljan on 14.05.24.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
   let latitude: Double?
   let longitude: Int?
   let generationTimeMS: Double?
   let UTCOffsetSeconds: Int?
   let timezone, timezoneAbbreviation: String?
   let elevation: Int?
   let currentWeatherUnits: CurrentWeatherUnits?
   let currentWeather: CurrentWeather?

   enum CodingKeys: String, CodingKey {
       case latitude, longitude
       case generationTimeMS = "generationtime_ms"
       case UTCOffsetSeconds = "utc_offset_seconds"
       case timezone
       case timezoneAbbreviation = "timezone_abbreviation"
       case elevation
       case currentWeatherUnits = "current_weather_units"
       case currentWeather = "current_weather"
   }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
   let time: String?
   let interval: Int?
   let temperature, windspeed: Double?
   let windDirection, isDay, weatherCode: Int?

   enum CodingKeys: String, CodingKey {
       case time, interval, temperature, windspeed, windDirection
       case isDay = "is_day"
       case weatherCode
   }
}

// MARK: - CurrentWeatherUnits
struct CurrentWeatherUnits: Codable {
   let time, interval, temperature, windspeed: String?
   let windDirection, isDay, weatherCode: String?

   enum CodingKeys: String, CodingKey {
       case time, interval, temperature, windspeed, windDirection
       case isDay = "is_day"
       case weatherCode
   }
}
