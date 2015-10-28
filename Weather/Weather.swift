//
//  Weather.swift
//  Weather
//
//  Created by Paul Kirk Adams on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Weather {

    static let wxConditionSuperSuperKey = "weather" // Yields array of dicionaries
    static let wxConditionSuperKey = 0 // Yields dictionary
    static let wxConditionKey = "description" // Yields string

    static let tempKSuperKey = "main" // Yields dictionary
    static let tempKKey = "temp" // Yields string

    static let windSpeedSuperKey = "wind" // Yields dictionary
    static let windSpeedKey = "speed" // Yields string

    static let cityNameSuperKey = "sys" // Yields dictionary
    static let cityNameKey = "name" // Yields string

    var wxCondition: String = ""
    var tempK: Float = 0.0
    var tempC: Float {
        get {
            return tempK - 273.15
        }
    }
    var windSpeed: Float = 0.0
    var cityName: String = ""

    init (jsonDictionary: [String: AnyObject]) {
        // Get wxCondition
        if let wxConditionSuperSuperArray = jsonDictionary[Weather.wxConditionSuperSuperKey] as? [[String: AnyObject]] {
            if let wxConditionSuperDictionary = wxConditionSuperSuperArray [Weather.wxConditionSuperKey] as? [String: AnyObject] {
                if let wxCondition = wxConditionSuperDictionary [Weather.wxConditionKey] as? String {
                    self.wxCondition = wxCondition
                }
            }
        }

        // Get tempK

        if let tempKSuperDictionary = jsonDictionary[Weather.tempKSuperKey] as? [String: AnyObject] {
            if let tempK = tempKSuperDictionary [Weather.tempKKey] as? Float {
                self.tempK = tempK
            }
        }

        // Get Wind Speed

        if let windSpeedSuperDictionary = jsonDictionary[Weather.windSpeedSuperKey] as? [String: AnyObject] {
            if let windSpeed = windSpeedSuperDictionary [Weather.windSpeedKey] as? Float {
                self.windSpeed = windSpeed
            }
        }

        // Get City Name

        if let cityNameSuperDictionary = jsonDictionary[Weather.cityNameSuperKey] as? [String: AnyObject] {
            if let cityName = cityNameSuperDictionary [Weather.cityNameKey] as? String {
                self.cityName = cityName
            }
        }

    }
}