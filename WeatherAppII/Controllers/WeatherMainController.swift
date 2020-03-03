import UIKit

class WeatherMainController: UIViewController {

    let mainView = WeatherMainView()
    
    var weatherForcast = [WeatherInterval]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        getWeatherInfo()
    }
    
    func getWeatherInfo() {
        WeatherAPIClient.weatherAPI(league: "") { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.weatherForcast = data
                print("we got data")
            }
        }
    }

}


