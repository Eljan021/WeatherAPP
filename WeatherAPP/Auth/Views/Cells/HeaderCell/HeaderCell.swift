//
//  HeaderCell.swift
//  WeatherAPP
//
//  Created by Eljan on 09.05.24.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    @IBOutlet private weak var backroundView: UIView!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backroundView.layer.cornerRadius = 20
    }

    @IBAction func plusButtonClicked(_ sender: UIButton) {
        print("plus")
    }
    @IBAction func menuButtonClicked(_ sender: UIButton) {
        print("menu")
    }
}
