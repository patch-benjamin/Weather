//
//  NetworkController.swift
//  Weather
//
//  Created by Paul Kirk Adams on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {

    static let apiKey = "ca1c3fb65aa0e96d671d124200dbc579"

    static let baseCityURL = "http://api.openweathermap.org/data/2.5/weather?q="

    //    static let baseZIPURL = "api.openweathermap.org/data/2.5/weather?zip="

    static func searchURL(searchNameString: String) -> NSURL {
        let escapedSearchNameString = searchNameString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())

        let urlString = "\(baseCityURL)\(escapedSearchNameString!)&appid=\(apiKey)"

        print("URLSTRING: " + urlString)

        return NSURL(string: urlString)!
    }

    static func dataAtURL(dataAtURL: NSURL, completion: (resultData: NSData?) -> Void) {

        let session = NSURLSession.sharedSession()

        let dataTask = session.dataTaskWithURL(dataAtURL) { (resultData, _, error) -> Void in

            if error != nil {
                print("Data Task URL Retrieval Failure")

            }

            completion(resultData: resultData)
        }
        
        dataTask.resume()
    }
    
}
