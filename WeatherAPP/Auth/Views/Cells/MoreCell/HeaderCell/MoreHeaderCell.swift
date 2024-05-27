//
//  MoreHeaderCell.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.
//

import UIKit

class MoreHeaderCell: UICollectionViewCell {
    @IBOutlet private weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(title: String) {
        cellLabel.text = title
    }

}
