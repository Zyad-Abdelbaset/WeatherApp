//
//  Location.swift
//  Weather
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let localtime: String?

    
    
    init() {
        name = ""
        region=""
        country=""
        lat=0
        lon=0
        localtime=""
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decode(String.self, forKey: .region)
        self.country = try container.decode(String.self, forKey: .country)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.lon = try container.decode(Double.self, forKey: .lon)
        self.localtime = try container.decode(String.self, forKey: .localtime)
    }
    
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case localtime
    }
    
}
