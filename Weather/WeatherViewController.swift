//
//  WeatherViewController.swift
//  Weather
//
//  Created by Paul Kirk Adams on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchName = searchBar.text

        WeatherController.sharedInstance.searchForWeather(searchName!) { (weather) -> Void in
            if let weather = weather {

                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.cityLabel.text = weather.cityName
                    self.temperatureLabel.text = "\(weather.tempF)℉"
                    self.conditionLabel.text = weather.wxCondition
                    self.windSpeedLabel.text = "wind \(weather.windSpeedMPH) mph"
                })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
