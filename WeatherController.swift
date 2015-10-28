//
//  WeatherController.swift
//  Weather
//
//  Created by Paul Kirk Adams on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    static let sharedInstance = WeatherController()

    func searchForWeather(searchName: String, completion: (weather: Weather?) -> Void) {

        let URL = NetworkController.searchURL(searchName)

        NetworkController.dataAtURL(URL) { (resultData) -> Void in

            guard let data = resultData
                else {
                    print("Data Request Failed")
                    completion(weather: nil)
                    return
            }

            do {
                let jsDictionaryAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                if let jsDictionary = jsDictionaryAnyObject as? [String: AnyObject] {
                    completion(weather: Weather(jsonDictionary: jsDictionary))
                } else {
                    completion(weather: nil)
                }
            } catch {
                print("JSON Serialization Threw Error")
                completion(weather: nil)
            }

        }

    }
    
}
