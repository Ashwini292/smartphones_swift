//
//  TableViewController.swift
//  GetWeatherForecast
//
//  Created by Ashwini on 2/15/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cities = ["Seattle", "Bellevue", "Los Angeles", "Portland", "San Diego", "New York city"]
    let temp = ["5","6","19","8","17","1"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell

        cell.lblCity.text = cities[indexPath.row]
        cell.lblTemperature.text = "\(temp[indexPath.row])ºC"

        return cell
    }

}
