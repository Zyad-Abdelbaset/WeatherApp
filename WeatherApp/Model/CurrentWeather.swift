//
//  CurrentWeather.swift
//  Weather
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
// MARK: - Current
struct CurrentWeather: Decodable {

    let tempC,tempF: Double //tempC
    let isDay: Int //isDay
    let condition: Condition //condi
    let pressureMB: Int //press
    let humidity: Int //humidity
    let feelslikeC : Double //feelslike c
    let visKM: Int //visKM
    let time: String? //time
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tempC = try container.decode(Double.self, forKey: .tempC)
        self.tempF = try container.decode(Double.self, forKey: .tempF)
        self.isDay = try container.decode(Int.self, forKey: .isDay)
        self.condition = try container.decode(Condition.self, forKey: .condition)
        self.pressureMB = try container.decode(Int.self, forKey: .pressureMB)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
        self.feelslikeC = try container.decode(Double.self, forKey: .feelslikeC)
        self.visKM = try container.decode(Int.self, forKey: .visKM)
        self.time = try container.decodeIfPresent(String.self, forKey: .time)
    }
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case pressureMB = "pressure_mb"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
        case time
    }
}
struct Condition: Codable {
    let text: Texts
    let icon: Icon
    let code: Int
}
enum Icon: String, Codable {
    case cdnWeatherapiCOMWeather64X64Day113PNG = "//cdn.weatherapi.com/weather/64x64/day/113.png"
    case cdnWeatherapiCOMWeather64X64Day116PNG = "//cdn.weatherapi.com/weather/64x64/day/116.png"
    case cdnWeatherapiCOMWeather64X64Night113PNG = "//cdn.weatherapi.com/weather/64x64/night/113.png"
}

enum Texts: String, Codable {
    case clear = "Clear"
    case partlyCloudy = "Partly Cloudy "
    case sunny = "Sunny"
    case textClear = "Clear "
}
