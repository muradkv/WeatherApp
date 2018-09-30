//
//  MyCitiesCell.swift
//  WeatherApp
//
//  Created by murad on 01/10/2018.
//  Copyright © 2018 Murad. All rights reserved.
//

import UIKit

class MyCitiesCell: UITableViewCell {
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
