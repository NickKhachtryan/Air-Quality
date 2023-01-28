//
//  AirData.swift
//  Air Quality
//
//  Created by Nick Khachatryan on 05.01.2021.
//

import Foundation

//typealias myPersonalCodable = Decodable & Encodable

struct AirData : Codable{
    let city_name : String
    let data : [DataJSON]
}

struct DataJSON : Codable{
    let aqi : Int
    let co : Float
}














