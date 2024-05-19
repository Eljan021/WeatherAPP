//
//  WeatherModel.swift
//  WeatherAPP
//
//  Created by Eljan on 14.05.24.
//


import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let latitude, longitude, generationtimeMS: Double?
    let utcOffsetSeconds: Int?
    let timezone, timezoneAbbreviation: String?
    let elevation: Int?
    let hourlyUnits: HourlyUnits?
    let hourly: Hourly?
    let currentWeatherUnits: CurrentWeatherUnits?
    let currentWeather: CurrentWeather?
    let dailyUnits: DailyUnits?
    let daily: Daily?

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
        case currentWeatherUnits = "current_weather_units"
        case currentWeather = "current_weather"
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let time: String?
    let interval: Int?
    let temperature, windspeed: Double?
    let winddirection, isDay, weathercode: Int?

    enum CodingKeys: String, CodingKey {
        case time, interval, temperature, windspeed, winddirection
        case isDay = "is_day"
        case weathercode
    }
}

// MARK: - CurrentWeatherUnits
struct CurrentWeatherUnits: Codable {
    let time, interval, temperature, windspeed: String?
    let winddirection, isDay, weathercode: String?

    enum CodingKeys: String, CodingKey {
        case time, interval, temperature, windspeed, winddirection
        case isDay = "is_day"
        case weathercode
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]?
    let temperature2MMax, temperature2MMin: [Double]?
    let precipitationProbabilityMean: [Int]?

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationProbabilityMean = "precipitation_probability_mean"
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax, temperature2MMin, precipitationProbabilityMean: String?

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationProbabilityMean = "precipitation_probability_mean"
    }
}
// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]?
    let temperature2M: [Double]?

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, temperature2M: String?

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}
