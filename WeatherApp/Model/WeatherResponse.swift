//
//  WeatherResponse.swift
//  Weather
//
//  Created by Mohamed Mahgoub on 22/08/2024.
//


import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Decodable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}
