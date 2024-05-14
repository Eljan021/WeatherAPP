//
//  HeaderCell.swift
//  WeatherAPP
//
//  Created by Eljan on 09.05.24.
//

import UIKit

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
    func headerview(){
        backroundView.clipsToBounds = true
        backroundView.setGradientBackground(colorTop: .headertopCell, colorBottom: .headerbottomCell)
     
    }

    @IBAction func plusButtonClicked(_ sender: UIButton) {
        print("plus")
    }
    @IBAction func menuButtonClicked(_ sender: UIButton) {
        print("menu")
    }
}
