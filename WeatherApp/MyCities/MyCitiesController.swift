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
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        //Проверяем идентификатор перехода, чтобы убедиться, что это нужный переход
        if segue.identifier == "addCity" {
            //Получаем ссылку на контроллер с которого осуществлен переход
            let allCitiesController = segue.source as! AllCitiesController
            //Получаем индекс выделенной ячейки
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                //Получаем город по индексу
                let city = allCitiesController.citiesArray[indexPath.row]
                //Проверяем что такого города нет в списке
                if !citiesArray.contains(city) {
                    //Добавляем город в список выбранных
                    citiesArray.append(city)
                    //Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
