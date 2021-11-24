//
//  ViewController.swift
//  WeatherApp
//
//  Created by Areej Mohammad on 12/04/1443 AH.
//

import UIKit

class ViewController: UIViewController  {
    
var weathermanger = WeatherManger()
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var city: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weathermanger.delegate = self
        
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchText.endEditing(true)
        if let city = searchText.text {
            weathermanger.fitchWeather(CityName: city)
        }
    }
   

}
extension ViewController : WeatherMangerDelegate {
    func didUpdateWeather(weatherManger: WeatherManger, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temp.text = weather.temperatureString
            self.imageWeather.image = UIImage(named: weather.conditionName)
            self.city.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
