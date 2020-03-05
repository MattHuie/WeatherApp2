
import UIKit

class WeatherMainScrollView: UIScrollView {

    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "City"
        label.backgroundColor = .white
        return label
    }()
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.text = "State"
        label.backgroundColor = .white
        return label
    }()
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperature Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var humidityText: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.backgroundColor = .white
        return label
    }()
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var windDirectionLabel: UILabel = {
        let label = UILabel()
        label.text = "WindDirection Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "WindSpeed Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var feelsLikeText: UILabel = {
        let label = UILabel()
        label.text = "Feels like"
        label.backgroundColor = .white
        return label
    }()
    lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.text = "FeelsLike Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var visibilityText: UILabel = {
        let label = UILabel()
        label.text = "Visibility"
        label.backgroundColor = .white
        return label
    }()
    lazy var visibilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Visibility Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunriseText: UILabel = {
        let label = UILabel()
        label.text = "Sunrise"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var sunsetText: UILabel = {
        let label = UILabel()
        label.text = "Sunset"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var locateButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var forcastCollectionView: UICollectionView = {
       var collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
               collectionLayout.itemSize = CGSize.init(width: 250, height: 400)
        var collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: collectionLayout)
        collection.backgroundColor = .white
               return collection
        
        }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 300)
        setupCityState()
        setupTemperature()
        setupWeather()
        setupFeelsLike()
        setupHumidity()
        setupWindDirection()
        setupVisibility()
        setupSunrise()
        setupSunset()
        setupCollectionView()
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func setupCityState() {
        addSubview(stateLabel)
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50)
        ])
    }
    func setupTemperature() {
        addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -250),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 150),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupWeather() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            weatherLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
    func setupFeelsLike() {
        addSubview(feelsLikeText)
        addSubview(feelsLikeLabel)
        feelsLikeText.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feelsLikeText.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            feelsLikeText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            feelsLikeLabel.topAnchor.constraint(equalTo: feelsLikeText.bottomAnchor, constant: 10),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeText.leadingAnchor, constant: 5)
        ])
    }
    func setupHumidity() {
        addSubview(humidityText)
        addSubview(humidityLabel)
        humidityText.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humidityText.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: 20),
            humidityText.leadingAnchor.constraint(equalTo: feelsLikeText.leadingAnchor, constant: 0),
            humidityLabel.topAnchor.constraint(equalTo: humidityText.bottomAnchor, constant: 10),
            humidityLabel.leadingAnchor.constraint(equalTo: feelsLikeLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupWindDirection() {
        addSubview(windDirectionLabel)
        addSubview(windSpeedLabel)
        windDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 20),
            windDirectionLabel.leadingAnchor.constraint(equalTo: humidityText.leadingAnchor, constant: 0),
            windSpeedLabel.topAnchor.constraint(equalTo: windDirectionLabel.bottomAnchor, constant: 10),
            windSpeedLabel.leadingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupVisibility() {
        addSubview(visibilityText)
        addSubview(visibilityLabel)
        visibilityText.translatesAutoresizingMaskIntoConstraints = false
        visibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visibilityText.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            visibilityText.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 50),
            visibilityLabel.topAnchor.constraint(equalTo: visibilityText.bottomAnchor, constant: 10),
            visibilityLabel.leadingAnchor.constraint(equalTo: visibilityText.leadingAnchor, constant: 5)
        ])
    }
    func setupSunrise() {
        addSubview(sunriseText)
        addSubview(sunriseLabel)
        sunriseText.translatesAutoresizingMaskIntoConstraints = false
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunriseText.topAnchor.constraint(equalTo: visibilityLabel.bottomAnchor, constant: 20),
            sunriseText.leadingAnchor.constraint(equalTo: visibilityText.leadingAnchor, constant: 0),
            sunriseLabel.topAnchor.constraint(equalTo: sunriseText.bottomAnchor, constant: 10),
            sunriseLabel.leadingAnchor.constraint(equalTo: visibilityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupSunset() {
        addSubview(sunsetText)
        addSubview(sunsetLabel)
        sunsetText.translatesAutoresizingMaskIntoConstraints = false
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunsetText.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 20),
            sunsetText.leadingAnchor.constraint(equalTo: sunriseText.leadingAnchor, constant: 0),
            sunsetLabel.topAnchor.constraint(equalTo: sunsetText.bottomAnchor, constant: 10),
            sunsetLabel.leadingAnchor.constraint(equalTo: sunriseLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupLocate() {
        addSubview(locateButton)
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
    
    
    func setupCollectionView() {
        addSubview(forcastCollectionView)
        forcastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forcastCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forcastCollectionView.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 40),
            forcastCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            forcastCollectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 5),
            forcastCollectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
    }
}
