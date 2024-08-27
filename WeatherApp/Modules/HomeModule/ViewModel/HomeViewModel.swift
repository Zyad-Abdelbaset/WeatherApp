//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
class HomeViewModel:ObservableObject {
    @Published var weatherResponse:WeatherResponse?
    func getData() {
        DataParser().parsingData(ClassType: WeatherResponse.self) { decodedData in
            DispatchQueue.main.async {
                self.weatherResponse=decodedData
            }
            
        }
    }
    init() {
        getData()
    }
}
