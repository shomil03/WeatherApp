//
//  ContentView.swift
//  WeatherApp
//
//  Created by Shomil Singh on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight : Bool = false
    var body: some View {
        ZStack{
                BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(city: "Kanpur , UP")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temperature: 76)
                
           
                
                HStack(spacing: 20){
                    WeatherDayView(day: "TUE", weatherImage: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(day: "WED", weatherImage:  "sun.max.fill", temperature: 88)
                    WeatherDayView(day: "THURS", weatherImage: "wind.snow", temperature: 75)
                    WeatherDayView(day: "FRI", weatherImage: "tornado", temperature: 70)
                    WeatherDayView(day: "SAT", weatherImage: "snow", temperature: 60)
                   
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    ButtonStyle(text: "Change Day Time", backgroundColor: Color.white, foregroundColor: Color.blue)
                    
                })
                
                Spacer()
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day : String
    var weatherImage : String
    var temperature : Int
    var body: some View {
        VStack{
            
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: weatherImage)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .frame(width: 40,height: 40)
                .scaledToFit()
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? Color(.black) : Color(.blue),
                                      isNight ? Color(.gray) : Color(.lightBlue)]),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        .animation(.easeIn, value: isNight)
    }
}

struct MainWeatherView: View {
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            //                        .padding()
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundStyle(.white)
            
        }
        .padding(.bottom , 40)
        .animation(.easeIn, value: imageName)
    }
}

struct ButtonStyle: View {
    var text : String
    var backgroundColor : Color
    var foregroundColor : Color
    var body: some View {
        Text(text)
            .frame(width: 280 , height: 50)
            .background(backgroundColor)
            .foregroundStyle(.blue)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct CityTextView: View {
    var city : String
    var body: some View {
        Text(city)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .padding()
    }
}
