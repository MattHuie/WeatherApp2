import UIKit

class WeatherMainController: UIViewController {

    let mainView = WeatherMainScrollView()
    
    var weatherForcast = [WeatherStats]()
    var weatherCurrent: WeatherInformation?
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
            if let data = data {
                self.weatherForcast = data
            }else if let error = error {
                print(error)
            }
        }
        WeatherAPIClient.weatherCurrentAPI(zipcode: "") { (error, data) in
            if let data = data {
                       self.weatherCurrent = data
                   }else if let error = error {
                       print(error)
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
}



