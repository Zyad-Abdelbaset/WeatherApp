//
//  HomeView.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel:HomeViewModel=HomeViewModel()
    var body: some View {
                VStack{
                    locationView
                    Divider()
                    Spacer()
                    Text("3 Day ForeCast").frame(maxWidth:350,alignment: .leading)
                        .font(.title3)
                    Divider()
                    
                    listForeCast
                    Divider()
                    weatherDetailsView
                    Spacer()
                }
                .applyBackground()
                .applyForeground()
                
    }
}

extension HomeView{
    
    //MARK: background
    var background:some View{
        Image(viewModel.weatherResponse?.current.isDay == 1 ? "day" : "night",bundle: nil)
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .scaledToFill()
    }

    //MARK: locationView
    var locationView:some View{
        VStack{
            Text(viewModel.weatherResponse?.location.name ?? "Cairo")
                .font(.largeTitle)
            Text(viewModel.weatherResponse?.location.localtime ?? "2024")
            Text("\(viewModel.weatherResponse?.current.tempC ?? 35, specifier: "%0.1f")")
            Text("\(viewModel.weatherResponse?.current.condition.text.rawValue ?? "Sunny")")
            HStack{
                Text("H:\(viewModel.weatherResponse?.forecast.forecastday.first?.day.maxtempC ?? 35, specifier: "%0.1f")")
                Text("L:\(viewModel.weatherResponse?.forecast.forecastday.first?.day.mintempC ?? 20,specifier: "%0.1f")")
            }
            if let url = URL(string: "https:" + (viewModel.weatherResponse?.current.condition.icon.rawValue ?? "//cdn.weatherapi.com/weather/64x64/day/116.png")) {
                AsyncImage(url: url)
                    .frame(width: 20,height: 20)
            }
        }
    }
    //MARK: List
    
    var listForeCast:some View{
        List(viewModel.weatherResponse?.forecast.forecastday ?? [],id: \.date){ item in
            NavigationLink {
                WeatherDetailsView(viewModel: WeatherDetailsViewModel(arr: item.hour))
                    .transition(.opacity.animation(.easeInOut))
                    //.animation(.easeInOut)
            } label: {
                ForeCastView(day:DateOptimizer.getDayName(from: item.date) , icon: item.day.condition.icon.rawValue, hTemp: item.day.maxtempC, lTemp: item.day.mintempC).listRowBackground(Color.clear)
                Divider()
                    
            }.listRowBackground(Color.clear)
                .frame(maxWidth:.infinity,maxHeight: 30)

        }.listStyle(PlainListStyle())
            .frame(maxWidth:.infinity,maxHeight: 150)
    }
    //MARK: WeatherDetails
    var weatherDetailsView:some View{
        HStack{
            VStack{
                DetailsItemView(title: "VISIBILITY", value: "\(viewModel.weatherResponse?.current.visKM ?? 0) km")
                Divider().frame(width: 100)
                    .padding(.bottom,10)
                
                DetailsItemView(title: "FEELS LIKE", value: "\(viewModel.weatherResponse?.current.feelslikeC ?? 0)°")
            }
            .padding(.trailing,50)
            VStack{
                DetailsItemView(title: "HUMIDITY", value: "\(viewModel.weatherResponse?.current.humidity ?? 0)%")
                Divider().frame(width: 100)
                    .padding(.bottom,30)
                DetailsItemView(title: "PRESSURE", value: "\(viewModel.weatherResponse?.current.pressureMB ?? 0) mb")
            }
        }
    }
    
}
#Preview {
    NavigationView{
        HomeView()
    }
}
