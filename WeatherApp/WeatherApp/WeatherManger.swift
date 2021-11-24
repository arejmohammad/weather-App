//
//  NetworkManger.swift
//  WeatherApp
//
//  Created by Areej Mohammad on 12/04/1443 AH.
//

import Foundation

protocol WeatherMangerDelegate {
    func didUpdateWeather(weatherManger: WeatherManger, weather : WeatherModel)
    func didFailWithError (error : Error)
}

struct WeatherManger {
    
    var delegate : WeatherMangerDelegate?
    
    private let APIKey = "0d1b6e5be8a5e20e6ba1b1595b71dbaa"
    func fitchWeather( CityName: String ) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(CityName)&appid=\(APIKey)&units=metric"
        print(urlString)
        performRequest (urlString: urlString)
    }
    func performRequest (urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data , response , error in
                if error != nil {
                    self.delegate?.didFailWithError(error:error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJson(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weatherManger: self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJson(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionaId: id, cityName: name, temperature: temp)
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//
//            guard let data = data else {return}
//            do {
//                let decodedUsers = try JSONDecoder().decode(WeatherData.self, from: data)
//                completion(decodedUsers)
////                print(decodedUsers)
//            } catch {
//                print("Failed to decode json \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}

//https://api.openweathermap.org/data/2.5/weather?q=Jeddah&appid=0d1b6e5be8a5e20e6ba1b1595b71dbaa&units=metric
