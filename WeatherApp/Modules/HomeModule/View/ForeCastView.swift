//
//  ForeCastView.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import SwiftUI

struct ForeCastView: View {
    var day:String
    var icon : String
    var hTemp:Double
    var lTemp:Double
    var body: some View {
        HStack{
            HStack{
                Text(day).frame(maxWidth:100,alignment: .leading)
                    
            }
            Spacer()
            HStack{
                Spacer()
                if let url = URL(string: "https:" + (icon)) {
                    AsyncImage(url: url)
                        .frame(width: 20,height: 20)
                }
                Spacer()
                Text("H:\(hTemp,specifier: "%0.1f")   L:\(lTemp,specifier: "%0.1f")")
            }
            //Spacer()
           
                
                
            
            
            
        }.padding()
    }
}

#Preview {
    ForeCastView(day: "Today", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", hTemp: 22, lTemp: 22)
}
