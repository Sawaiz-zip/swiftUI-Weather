//
//  ContentView.swift
//  swiftUI-Weather
//
//  Created by Sawaiz Naveed on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight  =  false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Ilmenau, Germany")
                weatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperatureValue: 3)
                Spacer()
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 3)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", temperature: 1)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "snowflake", temperature: -3)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.fill", temperature: -2)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "sun.max.fill", temperature: 2)

                }.padding()
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    weatherButton(buttonTitle: "Change Day Time", foregroundColor: Color(.blue), backgroundColor: Color(.white))
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
        HStack{
            VStack{
                Text(dayOfWeek)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundStyle(Color(.white))
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(temperature)°")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundStyle(Color(.white))
                
            }
            Spacer()
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue , isNight ? .gray : .lightBlue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(Color(.white))
            .padding()
    }
}

struct weatherStatusView: View {
    var imageName: String
    var temperatureValue: Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperatureValue)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

