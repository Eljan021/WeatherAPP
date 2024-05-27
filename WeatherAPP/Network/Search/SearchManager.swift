//
//  SearchManager.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    func getSearchList(query: String, complete: @escaping((SearchModel?, String?) -> Void)) {
        let url = "https://geocoding-api.open-meteo.com/v1/search?name=\(query)&count=2&language=en&format=json"
        NetworkManager.shared.request(
            type: SearchModel.self,
            url: url,
            header: NetworkHelper.shared.header,
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

