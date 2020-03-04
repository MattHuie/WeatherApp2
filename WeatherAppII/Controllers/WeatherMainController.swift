import UIKit

class WeatherMainController: UIViewController {

    let mainView = WeatherMainScrollView()
    
    var weatherForcast = [WeatherStats]()
    var weatherCurrent: WeatherInformation?{
        didSet{
            DispatchQueue.main.async {
                self.viewDidLoadSetup()
            }
        }
    }
    var weatherHourly = [WeatherStatsHourly]()
    var navagationItem = UINavigationItem.init(title: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(SegueToLocationVC))

        view.addSubview(mainView)
        getWeatherInfo()
    }
    
    func getWeatherInfo() {
        WeatherAPIClient.weatherAPI(zipcode: "") { (error, data) in
            if let error = error{
                print(error)
            }else if let data = data {
                self.weatherForcast = data
            }
        }
        WeatherAPIClient.weatherCurrentAPI(zipcode: "") { (error, data) in
           if let error = error {
            print(error)
                   }else  if let data = data {
                        self.weatherCurrent = data
            }
        }
        
        WeatherAPIClient.weatherHourlyAPI(zipcode: "") { (error, data) in
            if let error = error {
                       print(error)
                   }else if let data = data {
                          self.weatherHourly = data
                      }
        }

    }
    @objc func SegueToLocationVC(_ sender: UIButton!){
    let viewController = SettingsController()
    self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func viewDidLoadSetup(){
        if let currentWeather = weatherCurrent{
            mainView.feelsLikeLabel.text = "\(currentWeather.feelslikeF) °"
            mainView.humidityLabel.text = "\(currentWeather.humidity)"
            
          let timeInDoubleSunset = Double(currentWeather.sunset)
           let timeInDoubleSunrise = Double(currentWeather.sunrise)
            let sunrise = Date(timeIntervalSince1970: timeInDoubleSunrise)
            let sunset = Date(timeIntervalSince1970: timeInDoubleSunset)
            
            mainView.sunriseLabel.text = "\(sunset)"
            mainView.sunsetLabel.text = "\(sunrise)"
            mainView.visibilityLabel.text = "\(currentWeather.visibilityMI) Miles"
            mainView.windSpeedLabel.text = "Wind Speed: \(currentWeather.windMPH) MPH"
            mainView.windDirectionLabel.text = "Wind Direction: \(currentWeather.windDir)"
            mainView.temperatureLabel.text = "\(currentWeather.tempF) °"
        }
        
    }
}



