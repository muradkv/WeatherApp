//
//  MyCitiesController.swift
//  WeatherApp
//
//  Created by murad on 01/10/2018.
//  Copyright © 2018 Murad. All rights reserved.
//

import UIKit

class MyCitiesController: UITableViewController {
    var citiesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as? MyCitiesCell {
            let city = citiesArray[indexPath.row]
            cell.cityName.text = city
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
