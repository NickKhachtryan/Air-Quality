//
//  AirManager.swift
//  Air Quality
//
//  Created by Nick Khachatryan on 25.12.2020.
//

import Foundation

protocol AirManagerDelegate {
    func getAirData(airModel : AirModel)
    func getError(locError : String)
    
}

class AirManager{
    
    
    //  MARK: - CUSTOM PROPERTIES
    var myDelegate : AirManagerDelegate?
    var airURL =  "http://api.weatherbit.io/v2.0/current/airquality?key=03355c2b0e084b79aa4665591f3c4833"
    
    
    //  MARK: - FUNCTION
    func requestAir(lat: Double , lon : Double){
        let locationURL = "\(airURL)&lat=\(lat)&lon=\(lon)"
        airRequest(locationURL)
        print(locationURL)
    }
    
    func requestAir(cityName : String){
        let nameCityURL = "\(airURL)&city=\(cityName)"
        airRequest(nameCityURL)
    }
    
    func airRequest(_ urlString : String){
        let url = URL(string: urlString)
        guard let safeURL = url else {return}
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: safeURL) { (data, urlResponse, error) in
            if error != nil {return}
            
            guard let receiveData = data else {return}
            if let air = self.handlingJSON(airData: receiveData){
                
                DispatchQueue.main.async {
                    self.myDelegate?.getAirData(airModel: air)
                }
            }
            //            let dataString = String(data: receiveData, encoding: .utf8)
            //
            //            print(dataString)
        }
        dataTask.resume()
    }
    
    func handlingJSON(airData : Data) -> AirModel?{
        let jsonDecoder = JSONDecoder()
        do {
            let decodeData = try jsonDecoder.decode(AirData.self , from: airData)
            let airIndex = decodeData.data[0].aqi
            let cityName = decodeData.city_name
            let air = AirModel(airIndex: airIndex, cityName: cityName)
            return air
        } catch {
            DispatchQueue.main.async {
                self.myDelegate?.getError(locError: error.localizedDescription)
            }
            return nil
        }
    }
}


//  MARK: - EXTENSION
extension AirManagerDelegate{
    func getAirData(airModel : AirModel){
    }
    func getError(locError : String){
    }
}















