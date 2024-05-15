//
//  FooterCell.swift
//  WeatherAPP
//
//  Created by Eljan on 09.05.24.
//

import UIKit

class FooterCell: UICollectionViewCell {
    @IBOutlet private weak var cellBackroundView: UIView!
    @IBOutlet private weak var weekDayLabel: UILabel!
    @IBOutlet private weak var weatherView: UIView!
    @IBOutlet private weak var weatherLabel: UILabel!
    @IBOutlet private weak var weatherPercentLabel: UILabel!
    @IBOutlet private weak var morningTemperatureLabel: UILabel!
    @IBOutlet private weak var nightTemperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(
        time: String,
        percent: String,
        morningTemp: String,
        nightTemp: String
    ) {
        weekDayLabel.text = time
        weatherPercentLabel.text = percent
        morningTemperatureLabel.text = morningTemp
        nightTemperatureLabel.text = nightTemp
    }

}
