//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
class WeatherDetailsViewModel{
    let hourlyForecast: [CurrentWeather]
    init(arr:[CurrentWeather]) {
        hourlyForecast = arr
    }
}
