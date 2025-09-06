//
//  ContentView.swift
//  WeatherForcast
//
//  Created by Caleb Wolfe on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                DayForcast(day: "Mon",
                           highTemp: 70,
                           lowTemp: 50,
                           isRainy: false)
                DayForcast(day: "Tues",
                           highTemp: 64,
                           lowTemp: 42,
                           isRainy: true)
                DayForcast(day: "Wed",
                           highTemp: 78,
                           lowTemp: 56,
                           isRainy: false)
            }
            VStack{
                DayForcast(day: "Thurs",
                           highTemp: 69,
                           lowTemp: 51,
                           isRainy: true)
                DayForcast(day: "Fri",
                           highTemp: 65,
                           lowTemp: 42,
                           isRainy: true)
                DayForcast(day: "Sat",
                           highTemp: 63,
                           lowTemp: 40,
                           isRainy: true)
            }
            DayForcast(day: "Sun",
                       highTemp: 58,
                       lowTemp: 35,
                       isRainy: true)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForcast :View {
    // Properties
    let day :String
    let highTemp :Int
    let lowTemp :Int
    let isRainy :Bool

    var body :some View {
        VStack {
            Text(day)
                .font(Font.title)
            
            if (isRainy){
                Image(systemName: "cloud.rain.fill")
                    .foregroundStyle(Color.blue)
                    .font(Font.largeTitle)
            } else{
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(Color.yellow)
                    .font(Font.largeTitle)
            }
            
            Text("High: \(highTemp)º")
                .fontWeight(Font.Weight.bold)
            Text("Low: \(lowTemp)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
