//
//  WeatherController.swift
//  WeatherApp
//
//  Created by murad on 01/10/2018.
//  Copyright © 2018 Murad. All rights reserved.
//

import UIKit

class WeatherController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            cell.weather.text = "25 C"
            cell.time.text = "1.10.2018"            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
