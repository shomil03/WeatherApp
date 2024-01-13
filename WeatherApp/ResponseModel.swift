//
//  ResponseModel.swift
//  WeatherApp
//
//  Created by Shomil Singh on 13/01/24.
//

import Foundation
struct ResponseModel : Codable{
    var lat : String
    var lon : String
    var units : String
    var daily : data

}
struct data : Codable{
    var data : [DailyData]
}
struct DailyData : Codable{
    var day: String
    var weather: String
    var temperature: Double
    var icon : Int
}
