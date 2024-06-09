//
//  MoreHeaderCell.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.
//

import UIKit

class MoreHeaderCell: UICollectionViewCell {
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCellCity(title: String) {
        cityLabel.text = title
       
    }
    func configureCellCounrty(title: String) {
        countryLabel.text = title
    }

}
