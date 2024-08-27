//
//  DateOptimizer.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
class DateOptimizer{
    static func getDayName(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                return "Today"
            } else {
                dateFormatter.dateFormat = "EEE"
                return dateFormatter.string(from: date)
            }
        }
        return dateString
    }
     static func formatTime(_ timeString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: timeString) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                let currentHour = calendar.component(.hour, from: Date())
                let forecastHour = calendar.component(.hour, from: date)
                
                if currentHour == forecastHour {
                    return "Now"
                }
            }
            dateFormatter.dateFormat = "h a"
            return dateFormatter.string(from: date)
        }
        return timeString
    }
}
