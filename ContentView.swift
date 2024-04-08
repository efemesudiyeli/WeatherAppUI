//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Efe Mesudiyeli on 6.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{
                CityNameView(cityName: "Antalya, TR")
                CurrentWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 32)
                
                HStack(spacing: 20,content: {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 32)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 36)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind",
                        temperature: 26)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "tornado",
                        temperature: 28)
                    
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.sun.rain.fill",
                        temperature: 32)
                })
                
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change day time", textColor: .blue, backgroundColor: Color.white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 4,content: {
            Text(dayOfWeek)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
        }).foregroundStyle(.white)
            .font(.system(size: 20))
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CurrentWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
            
        }.padding(.bottom, 40)
    }
}

