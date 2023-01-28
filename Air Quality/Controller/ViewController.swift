//
//  ViewController.swift
//  Air Quality
//
//  Created by Nick Khachatryan on 18.12.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , UITextFieldDelegate , AirManagerDelegate , CLLocationManagerDelegate{
    
    
    //  MARK: - OUTLETS
    @IBOutlet weak var labelYourPlace: UILabel!
    @IBOutlet weak var labelAirIndex: UILabel!
    @IBOutlet weak var textFieldEnterCity: UITextField!
    @IBOutlet weak var faceImage: UIImageView!
    
    
    //  MARK: - CUSTOM PROPERTIES
    let airManager = AirManager()
    let locationManager = CLLocationManager()
    
    
    //  MARK: - VC LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        airManager.myDelegate = self
        textFieldEnterCity.delegate = self
    }
    
    
    //  MARK: - ACTIONS
    @IBAction func pressedSearch(_ sender: UIButton) {
        if textFieldEnterCity.text == ""{
            textFieldEnterCity.placeholder = "Enter Place!"
            return
        }
        print(textFieldEnterCity.text!)
        textFieldEnterCity.endEditing(true)
    }
    
    @IBAction func pressedLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
//    MARK: - DELEGATION METHODS
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last?.coordinate{
            let lat = loc.latitude
            let lon = loc.longitude
            airManager.requestAir(lat: lat, lon: lon)
                    }
    }
    
    
//    MARK: DELEGATE TEXTFIELD
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            print(textField.text!)
            textField.endEditing(true)
            return true
        }
        textFieldEnterCity.placeholder = "Enter Place!"
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let city = textField.text else {return}
        airManager.requestAir(cityName: city)
        textField.text = ""
    }
    
    
    //    MARK: DELEGATE AIRMANAGER
    func getError(locError: String) {
        labelYourPlace.text = locError
    }
    
    func getAirData(airModel: AirModel) {
        labelAirIndex.text = "\(airModel.airIndex)"
        labelYourPlace.text = airModel.cityName
        faceImage.image = airModel.getImage
    }
}

