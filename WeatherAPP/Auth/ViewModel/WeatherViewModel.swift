//
//  WeatherViewModel.swift
//  WeatherAPP
//
//  Created by Eljan on 14.05.24.
//

import Foundation

struct WeatherViewModel {
    var weatherArray:[WeatherModel] = [
        WeatherModel(temperature: "20", weather: "sun", windSpeed: "15.0km/h", calendarDate: "May 15", weekDay: "Monday"),
        WeatherModel(temperature: "10", weather: "snow", windSpeed: "30.0km/h", calendarDate: "Jan 15", weekDay: "Sunday"),
        WeatherModel(temperature: "24", weather: "rain", windSpeed: "0.0km/h", calendarDate: "Feb 15", weekDay: "Tuesday"),
        WeatherModel(temperature: "12", weather: "cloud", windSpeed: "2.0km/h", calendarDate: "Dec 15", weekDay: "Friday")
    ]
    
}
