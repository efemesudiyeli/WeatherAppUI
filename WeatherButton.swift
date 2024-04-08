//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Efe Mesudiyeli on 6.04.2024.
//
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

