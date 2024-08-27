//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import SwiftUI

struct WeatherDetailsView: View {
    var viewModel:WeatherDetailsViewModel!
    var body: some View {
        List(viewModel.hourlyForecast, id: \.time) { hour in
            HStack {
                Text(DateOptimizer.formatTime(hour.time ?? ""))
                    .bold()
                Spacer()
                if let iconURL = URL(string: "https:" + (hour.condition.icon).rawValue) {
                    AsyncImage(url: iconURL)
                        .frame(width: 32, height: 32)
                }
                Spacer()
                Text("\(hour.tempC, specifier: "%.1f")°C")
                    .bold()
            }.listRowBackground(Color.clear)
        }
        .applyBackground()
        .applyForeground()
        .listStyle(PlainListStyle())
        .navigationTitle("Weather per hour")
    }
}

//#Preview {
//    WeatherDetailsView(viewModel: WeatherDetailsViewModel!)
//}
