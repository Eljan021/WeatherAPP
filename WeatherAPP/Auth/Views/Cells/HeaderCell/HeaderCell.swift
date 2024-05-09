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
    override func awakeFromNib() {
        super.awakeFromNib()
        backroundView.layer.cornerRadius = 20
    }

}
