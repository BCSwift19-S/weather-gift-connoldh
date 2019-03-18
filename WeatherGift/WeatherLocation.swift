//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by John Connolly on 3/17/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                    print("***** \(weatherURL)")
                }else {
                    print("Could not return a temp")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
        
    }
}






