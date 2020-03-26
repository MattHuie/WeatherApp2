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
    
    var cityImage: UIImage?{
        didSet{
            DispatchQueue.main.async {
                self.mainView.cityImage.image = self.cityImage
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
        self.title = "City"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(SegueToLocationVC))
        getWeatherInfo()
        
        mainView.forcastCollectionView.register(ForcastCollectionViewCell.self, forCellWithReuseIdentifier: "Forcast")
        mainView.hourlyCollectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: "Hourly")
        
        imageHelper()
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
    
    func imageHelper(){
        WeatherAPIClient.weatherImageAPI(location: "") { (error, image) in
            if let error = error{
                self.showAlert(title: "Error", message: error.errorMessage())
            }else if let image = image{
                guard let url = URL(string: image[0].largeImageURL) else{ return self.showAlert(title: "Error", message: "Url conversion failed")
                }
                ImageHelper.fetchImage(url: url) { (imageError, cityPicture) in
                    if let imageError = imageError{
                        self.showAlert(title: "Error", message: imageError.errorMessage())
                    }else if let cityPiture = cityPicture{
                        self.cityImage = cityPiture
                    }
                }
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
            mainView.sunriseLabel.text = sunTimeConverter(date: currentWeather.sunriseISO)
            mainView.sunsetLabel.text = (sunTimeConverter(date: currentWeather.sunsetISO))
            mainView.visibilityLabel.text = "\(currentWeather.visibilityMI) Miles"
            mainView.windSpeedLabel.text = "Wind Speed: \(currentWeather.windMPH) MPH"
            mainView.windDirectionLabel.text = "Wind Direction: \(currentWeather.windDir)"
            mainView.temperatureLabel.text = "\(currentWeather.tempF) °"
            mainView.weatherLabel.text = "\(currentWeather.weather.capitalized)"
            mainView.stateLabel.text = "State"
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
            let date = dateReturner(date: weatherForcast[indexPath.row].validTime)
            cell.dayOfTheWeekLabel.text = date[1]
            cell.numericDayValuelabel.text = date[0]

        return cell
            
        } else {
            guard let cell = mainView.hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: "Hourly", for: indexPath) as? HourlyCollectionViewCell else { return UICollectionViewCell()}
            let cellToSet = weatherHourly[indexPath.row]
            cell.hourHighLabel.text = "\(cellToSet.maxTempF)°"
            cell.hourLowLabel.text = "\(cellToSet.minTempF)°"
            cell.hourLabel.text = timeConverter(date: cellToSet.dateTimeISO)
            cell.hourTempLabel.text = "\(cellToSet.tempF)°"
            return cell
        }
    }
}
