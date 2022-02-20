//
//  TableViewCell.swift
//  GetWeatherForecast
//
//  Created by Ashwini on 2/15/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
