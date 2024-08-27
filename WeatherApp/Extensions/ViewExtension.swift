//
//  ViewExtension.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import SwiftUI


struct BackgroundModifier: ViewModifier {
    @StateObject var viewModel:HomeViewModel=HomeViewModel()
    func body(content: Content) -> some View {
        content
            .background(Image(viewModel.weatherResponse?.current.isDay == 1 ? "day" : "night",bundle: nil)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill())
    }
}

struct ForegroundModifier: ViewModifier {
    @StateObject var viewModel:HomeViewModel=HomeViewModel()
    func body(content: Content) -> some View {
        content
            .foregroundColor(viewModel.weatherResponse?.current.isDay == 1 ? .black : .white)
    }
}

extension View {
    func applyBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
    func applyForeground()->some View{
        self.modifier(ForegroundModifier())
    }
}
