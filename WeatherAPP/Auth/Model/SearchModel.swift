//
//  SearchModel.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let results: [ResultSC]?
    let generationtimeMS: Double?

    enum CodingKeys: String, CodingKey {
        case results
        case generationtimeMS = "generationtime_ms"
    }
}

// MARK: - Result
struct ResultSC: Codable {
    let id: Int?
    let name: String?
    let latitude, longitude: Double?
    let elevation: Int?
    let featureCode, countryCode, timezone: String?
    let population, countryID: Int?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude, elevation
        case featureCode = "feature_code"
        case countryCode = "country_code"
        case timezone, population
        case countryID = "country_id"
        case country
    }
}
