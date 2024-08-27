//
//  ForeCast.swift
//  Weather
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
struct Forecast: Decodable {
    let forecastday: [Forecastday]
}
struct Forecastday: Decodable {
    let date: String
    let day: Day
    let hour: [CurrentWeather]

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case hour
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.day = try container.decode(Day.self, forKey: .day)
        self.hour = try container.decode([CurrentWeather].self, forKey: .hour)
    }
}
struct Day: Decodable {
    let maxtempC:Double //
    let mintempC:Double //
   let condition: Condition
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxtempC = try container.decode(Double.self, forKey: .maxtempC)
       // self.maxtempF = try container.decode(Double.self, forKey: .maxtempF)
        self.mintempC = try container.decode(Double.self, forKey: .mintempC)
          self.condition = try container.decode(Condition.self, forKey: .condition)
    }
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}
