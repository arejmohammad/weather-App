//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Areej Mohammad on 14/04/1443 AH.
//

import Foundation

struct WeatherData : Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Weather : Codable {
    let id : Int
    let description : String
}
struct Main : Codable {
    let temp : Double
}

