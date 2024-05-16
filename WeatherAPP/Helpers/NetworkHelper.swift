//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://open-meteo.com/en"
    let header = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NDc3YTFhNmVjMTFlNmYxOThmNDQ1OWZhNjI1N2U0NiIsInN1YiI6IjY1ZGYzZTUyNzYxNDIxMDE4NWQ2MTVkYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VwqNBRxo4m4twkK13D0G2ncAYwDoyX0dR3T6MmNZLOo"
    ]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }
}
