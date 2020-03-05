import UIKit

class WeatherMainController: UIViewController {

    let mainView = WeatherMainScrollView()
    
    var weatherForcast = [WeatherStats](){
        didSet{
            DispatchQueue.main.async {
                self.mainView.forcastCollectionView.reloadData()
            }
        }
    }
    var weatherCurrent: WeatherInformation?{
        didSet{
            DispatchQueue.main.async {
                self.currentWeatherSetUp()
            }
        }
    }
    var weatherHourly = [WeatherStatsHourly](){
        didSet {
            DispatchQueue.main.async {
                self.mainView.hourlyCollectionView.reloadData()
            }
        }
    }
    var navagationItem = UINavigationItem.init(title: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        viewDidLoadSetup()

        mainView.forcastCollectionView.dataSource = self
        mainView.forcastCollectionView.delegate = self
        
        mainView.hourlyCollectionView.dataSource = self
        mainView.hourlyCollectionView.delegate = self
    }
    
    func viewDidLoadSetup(){
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "City"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(SegueToLocationVC))
        getWeatherInfo()
        
        mainView.forcastCollectionView.register(ForcastCollectionViewCell.self, forCellWithReuseIdentifier: "Forcast")
        mainView.hourlyCollectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: "Hourly")
    }
    
    func getWeatherInfo() {
        WeatherAPIClient.weatherAPI(zipcode: "") { (error, data) in
            if let error = error{
                print(error)
            } else if let data = data {
                self.weatherForcast = data
            }
        }
        WeatherAPIClient.weatherCurrentAPI(zipcode: "") { (error, data) in

            if let data = data {
                       self.weatherCurrent = data
                   } else if let error = error {
                       print(error)
                   }
           if let error = error {
                print(error)
                   } else if let data = data {
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
    
    func currentWeatherSetUp(){
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



extension WeatherMainController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.forcastCollectionView {
            return weatherForcast.count
        } else {
            return weatherHourly.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == mainView.forcastCollectionView {
        guard let cell =  mainView.forcastCollectionView.dequeueReusableCell(withReuseIdentifier: "Forcast", for: indexPath) as? ForcastCollectionViewCell else { return UICollectionViewCell()}
        
        cell.highTempLabel.text = "\(weatherForcast[indexPath.row].maxTempF)°"
        cell.lowTempLabel.text = "\(weatherForcast[indexPath.row].minTempF)°"
        cell.dayOfTheWeekLabel.text = "Monday"
        cell.numericDayValuelabel.text = "2/29"
        
        
        
        
        return cell
        } else {
            guard let cell = mainView.hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: "Hourly", for: indexPath) as? HourlyCollectionViewCell else { return UICollectionViewCell()}
            let cellToSet = weatherHourly[indexPath.row]
            cell.hourHighLabel.text = "\(cellToSet.maxTempF)°"
            cell.hourLowLabel.text = "\(cellToSet.minTempF)°"
            cell.hourLabel.text = "Hours"
            cell.hourTempLabel.text = "\(cellToSet.tempF)"
            return cell
        }
    }
    
    
    
}
