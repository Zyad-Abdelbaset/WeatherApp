//
//  DetailsItemView.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import SwiftUI

struct DetailsItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
            Text(value)
                .fontWeight(.semibold)
                .font(.largeTitle)
        }.padding()
            
    }
}

#Preview {
    DetailsItemView(title: "Visibility", value: "20")
}
