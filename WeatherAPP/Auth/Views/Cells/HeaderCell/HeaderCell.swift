//
//  HeaderCell.swift
//  WeatherAPP
//
//  Created by Eljan on 09.05.24.
//

import UIKit
protocol WeatherProtocol {
    var time: String {get}
    var percent: String {get}
    var morningTemp: String {get}
    var nightTemp: String {get}
}

class HeaderCell: UICollectionViewCell {
    @IBOutlet private weak var weekDayLabel: UILabel!
    @IBOutlet private weak var calendarDateLabel: UILabel!
    @IBOutlet private weak var weekAndCalendarView: UIView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherLabel: UILabel!
    @IBOutlet private weak var windspeedLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var weatherfooterView: UIView!
    @IBOutlet private weak var windView: UIView!
    
    @IBOutlet private weak var backroundView: UIView!
    @IBOutlet private weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerview()
        backroundView.layer.cornerRadius = 20
    }
    func configureCell(model: WeatherProtocol){
        weekDayLabel.text = model.time
        calendarDateLabel.text = model.percent
        temperatureLabel.text = model.morningTemp
        
    }
    
    func configureView(data: WeatherModel){
        temperatureLabel.text = "\(data.currentWeather?.temperature ?? 0) \(data.currentWeatherUnits?.temperature ?? "")"
        calendarDateLabel.text = data.currentWeather?.time ?? ""
        //        weekDayLabel.text = data.weekDay
        //        weatherLabel.text = data.weather
        windspeedLabel.text = "\(data.currentWeather?.windspeed ?? 0) \(data.currentWeatherUnits?.windspeed ?? "")"
        
    }
    func headerview(){
        backroundView.clipsToBounds = true
        backroundView.setGradientBackground(colorTop: .headertopCell, colorBottom: .headerbottomCell)
        
    }
    
}
