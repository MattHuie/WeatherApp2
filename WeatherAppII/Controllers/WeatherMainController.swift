import UIKit

class WeatherMainController: UIViewController {

    let mainView = WeatherMainView()
    
    var weatherForcast = [WeatherStats]()
    var weatherCurrent: WeatherInformation?
    var weatherHourly = [WeatherStatsHourly]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        getWeatherInfo()
    }
    
    func getWeatherInfo() {
        WeatherAPIClient.weatherAPI(zipcode: "") { (error, data) in
            if let data = data {
                self.weatherForcast = data
            }else if let error = error {
                print(error)
            }
        }
        WeatherAPIClient.weatherCurrentAPI(zipcode: "") { (error, data) in
            if let data = data {
                       self.weatherCurrent = data
                print(self.weatherCurrent)
                   }else if let error = error {
                       print(error)
                   }
        }
        
        WeatherAPIClient.weatherHourlyAPI(zipcode: "") { (error, data) in
            if let error = error {
                       print(error)
                   }else if let data = data {
                          self.weatherHourly = data
                   print(self.weatherHourly.count)
                      }
        }
    
    }
}



