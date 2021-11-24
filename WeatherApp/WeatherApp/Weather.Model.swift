//
//  Weather.Model.swift
//  WeatherApp
//
//  Created by Areej Mohammad on 15/04/1443 AH.
//

import Foundation
struct WeatherModel {
    let conditionaId : Int
    let cityName : String
    let temperature : Double
    
    var conditionName : String {
        switch conditionaId {
        case 200...232 :
            return "thunder-icon"
        case 300...321 :
            return "tornado-icon"
        case 500...531 :
            return "rain-icon"
        case 600...622 :
            return "snow-icon"
        case 701...781 :
            return "tornado-icon"
        case 800 :
            return "Sun Transparent PNG Clip Art Image"
        case 801...804 :
            return "image"
        default :
            return "Sun Transparent PNG Clip Art Image"
        }
 
        }
    var temperatureString : String {
        return String(format: "%.1f", temperature)
    }
}
