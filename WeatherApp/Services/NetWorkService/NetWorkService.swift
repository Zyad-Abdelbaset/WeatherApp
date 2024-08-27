//
//  NetWorkService.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
class NetWorkService{
    let longitude = 30.0715495
    let latitude = 31.0215953
    let apiKey = "e4c83b3aec244e7bb2a120019242208"
    var fullURL:URL{
        let url = "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(longitude),\(latitude)&days=3&aqi=yes&alerts=no"
        return URL(string: url)!
    }
    func fetchData(handler: @escaping ((Data) -> Void)) {
        let req = URLRequest(url: fullURL)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) { data, response, error in
            if error != nil {
                print("Error in fetching Data")
            }
            handler(data!)
        }
        task.resume()
    }
    
    
}
