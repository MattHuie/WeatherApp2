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
                self.backgroundImage.image = self.cityImage!
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
    
    var temperatureType = UserDefaults.standard.string(forKey: DefaultKeys.tempType)
    
    lazy var backgroundView : UIView = {
        let backgroundView = UIView()
        backgroundView.frame.size = self.mainView.contentViewSize
        return backgroundView
    }()
    lazy var backgroundImage : UIImageView = {
        let backgroundImage = UIImageView()
        return backgroundImage
    }()
    lazy var containerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.frame.size = self.mainView.contentViewSize
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)
        setUpImage()
        backgroundView.addSubview(mainView)
        viewDidLoadSetup()
        
        mainView.forcastCollectionView.dataSource = self
        mainView.forcastCollectionView.delegate = self
        mainView.hourlyCollectionView.dataSource = self
        mainView.hourlyCollectionView.delegate = self
    }

    func viewDidLoadSetup(){
        self.title = "City"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(SegueToLocationVC))
//        navigationController?.navigationBar.prefersLargeTitles = true
        getWeatherInfo()
        
        mainView.forcastCollectionView.register(ForcastCollectionViewCell.self, forCellWithReuseIdentifier: "Forcast")
        mainView.hourlyCollectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: "Hourly")
        
        imageHelper()
    }
    
    func setUpImage(){
        backgroundView.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: backgroundView.topAnchor),
                backgroundImage.heightAnchor.constraint(equalTo: backgroundView.heightAnchor),
                backgroundImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
                backgroundImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
                backgroundImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor)
        ])
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
            var windSpeed = "Wind Speed: \(currentWeather.windMPH) MPH"
            var visibility = "\(currentWeather.visibilityMI) Miles"
            var feelsLike = "\(currentWeather.feelslikeF)°f"
            var currentTemp = "\(currentWeather.tempF)°f"
            mainView.humidityLabel.text = "\(currentWeather.humidity)"
            mainView.sunriseLabel.text = sunTimeConverter(date: currentWeather.sunriseISO)
            mainView.sunsetLabel.text = (sunTimeConverter(date: currentWeather.sunsetISO))
            mainView.windDirectionLabel.text = "Wind Direction: \(currentWeather.windDir)"
            switch temperatureType{
                case "fahrenheit":
                    windSpeed = "Wind Speed: \(currentWeather.windMPH) MPH"
                    visibility = "\(currentWeather.visibilityMI) Miles"
                    feelsLike = "\(currentWeather.feelslikeF)°f"
                    currentTemp = "\(currentWeather.tempF)°f"
                case "celcius":
                    windSpeed = "Wind Speed: \(currentWeather.windKPH) KPH"
                    visibility = "\(currentWeather.visibilityKM) KM"
                    feelsLike = "\(currentWeather.feelslikeC)°c"
                    currentTemp = "\(currentWeather.tempC)°c"
                default:
                    windSpeed = "Wind Speed: \(currentWeather.windMPH) MPH"
                    visibility = "\(currentWeather.visibilityMI) Miles"
                    feelsLike = "\(currentWeather.feelslikeF)°f"
                    currentTemp = "\(currentWeather.tempF)°f"
            }
            mainView.windSpeedLabel.text = windSpeed
            mainView.visibilityLabel.text = visibility
            mainView.feelsLikeLabel.text = feelsLike
            mainView.temperatureLabel.text = currentTemp
            
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
            let cellToSet = weatherForcast[indexPath.row]
            switch temperatureType {
            case "fahrenheit":
                cell.highTempLabel.text = "\(cellToSet.maxTempF)°f"
                cell.lowTempLabel.text = "\(cellToSet.minTempF)°f"
            case "celcius":
                cell.highTempLabel.text = "\(cellToSet.maxTempC)°c"
                cell.lowTempLabel.text = "\(cellToSet.minTempC)°c"
            default:
                cell.highTempLabel.text = "\(cellToSet.maxTempF)°f"
                cell.lowTempLabel.text = "\(cellToSet.minTempF)°f"
            }
            let date = dateReturner(date: cellToSet.validTime)
            cell.dayOfTheWeekLabel.text = date[1]
            cell.numericDayValuelabel.text = date[0]

        return cell
            
        } else {
            guard let cell = mainView.hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: "Hourly", for: indexPath) as? HourlyCollectionViewCell else { return UICollectionViewCell()}
            let cellToSet = weatherHourly[indexPath.row]
            switch temperatureType {
            case "fahrenheit":
                cell.hourHighLabel.text = "\(cellToSet.maxTempF)°f"
                cell.hourLowLabel.text = "\(cellToSet.minTempF)°f"
                cell.hourTempLabel.text = "\(cellToSet.tempF)°f"
            case "celcius":
                cell.hourHighLabel.text = "\(cellToSet.maxTempC)°c"
                cell.hourLowLabel.text = "\(cellToSet.minTempC)°c"
                cell.hourTempLabel.text = "\(cellToSet.tempC)°c"
            default:
                cell.hourHighLabel.text = "\(cellToSet.maxTempF)°f"
                cell.hourLowLabel.text = "\(cellToSet.minTempF)°f"
                cell.hourTempLabel.text = "\(cellToSet.tempF)°f"
            }
            cell.hourLabel.text = timeConverter(date: cellToSet.dateTimeISO)
            return cell
        }
    }
}
