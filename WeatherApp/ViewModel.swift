//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Shomil Singh on 13/01/24.
//

import Foundation

class ViewModel : ObservableObject{
    
    func getWeatherInformation (){
        let cityname : String = "kanpur"
//        URL
        
        let url = URL(string: "https://ai-weather-by-meteosource.p.rapidapi.com/daily?place_id=\(cityname)&language=en&units=auto")
        
        guard url != nil else{
            print("Invalid URL")
            return
        }
        
        
//        URL Request
        
        var urlRequest = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
       
        
//        Specify the header
        
        let headers = [
            "X-RapidAPI-Key": "8850e0674amsh75dfa7ec5c70bf2p14ac07jsnad261988b0a7",
            "X-RapidAPI-Host": "ai-weather-by-meteosource.p.rapidapi.com"
        ]
        urlRequest.allHTTPHeaderFields = headers
        
//        Specify the body
        
//        Set request type
        
        urlRequest.httpMethod = "GET"
        
//        Get the URLSession
        
        let session = URLSession.shared
        
//        Create datatask
        
        let datatask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                print("error datatask \(error)")
                return
            }
            guard let data = data else{
                print("No data received")
                return
            }
            do{
                let decoder = JSONDecoder()
                
                let weatherData = try decoder.decode(ResponseModel.self, from: data)
//                print("data : \(weatherData)")
                print("response : \(response)")
            }catch{
                print("Error decoding data: \(error)")
            }
        }
        datatask.resume()
        
//        Fire off datatask
        
    }
    
}
