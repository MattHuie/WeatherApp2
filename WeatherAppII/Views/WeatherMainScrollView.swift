
import UIKit

class WeatherMainScrollView: UIScrollView {

    lazy var contentViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 300)
    
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
    lazy var temperatureLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.font = UIFont.boldSystemFont(ofSize: 60.0)
        label.text = "Temperature Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var humidityText: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Humidity"
        label.backgroundColor = .white
        return label
    }()
    lazy var humidityLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Humidity Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var windDirectionLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "WindDirection Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var windSpeedLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "WindSpeed Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var feelsLikeText: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Feels like"
        label.backgroundColor = .white
        return label
    }()
    lazy var feelsLikeLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "FeelsLike Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var visibilityText: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Visibility"
        label.backgroundColor = .white
        return label
    }()
    lazy var visibilityLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Visibility Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var weatherLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Weather Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunriseText: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Sunrise"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunriseLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Sunrise Label"
        label.backgroundColor = .white
        return label
    }()

    lazy var sunsetText: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Sunset"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunsetLabel: WRoundedCornersLabel = {
        let label = WRoundedCornersLabel()
        label.text = "Sunset Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var locateButton: UIButton = {
        let button = UIButton()
        return button
    }()
    lazy var cityImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .magenta
        return image
    }()
    
    lazy var forcastCollectionView: WRoundedCornersCV = {
        var collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize.init(width: 100, height: 200)
        var collection = WRoundedCornersCV(frame: UIScreen.main.bounds, collectionViewLayout: collectionLayout)
        collection.backgroundColor = .white
        return collection
    }()
    lazy var hourlyCollectionView: WRoundedCornersCV = {
        var collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.itemSize = CGSize(width: 100, height: 200)
        var collectionView = WRoundedCornersCV(frame: UIScreen.main.bounds, collectionViewLayout: collectionFlowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .clear
        self.contentSize = contentViewSize

        setupCityState()
        setupTemperature()
        setupWeather()
        setupHourlyCollectionView()
        setupFeelsLike()
        setupHumidity()
        setupSunrise()
        setupVisibility()
        setupWindDirection()
        setupSunset()
        setupForcastCollectionView()

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
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -350)
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
    func setupHourlyCollectionView() {
        addSubview(hourlyCollectionView)
        hourlyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourlyCollectionView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            hourlyCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }
    func setupFeelsLike() {
        addSubview(feelsLikeText)
        addSubview(feelsLikeLabel)
        feelsLikeText.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feelsLikeText.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 20),
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
    func setupSunrise() {
        addSubview(sunriseText)
        addSubview(sunriseLabel)
        sunriseText.translatesAutoresizingMaskIntoConstraints = false
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunriseText.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 20),
            sunriseText.leadingAnchor.constraint(equalTo: humidityText.leadingAnchor, constant: 0),
            sunriseLabel.topAnchor.constraint(equalTo: sunriseText.bottomAnchor, constant: 10),
            sunriseLabel.leadingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupVisibility() {
        addSubview(visibilityText)
        addSubview(visibilityLabel)
        visibilityText.translatesAutoresizingMaskIntoConstraints = false
        visibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visibilityText.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 20),
            visibilityText.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 50),
            visibilityLabel.topAnchor.constraint(equalTo: visibilityText.bottomAnchor, constant: 10),
            visibilityLabel.leadingAnchor.constraint(equalTo: visibilityText.leadingAnchor, constant: 5)
        ])
    }
    func setupWindDirection() {
        addSubview(windDirectionLabel)
        addSubview(windSpeedLabel)
        windDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionLabel.topAnchor.constraint(equalTo: visibilityLabel.bottomAnchor, constant: 20),
            windDirectionLabel.leadingAnchor.constraint(equalTo: visibilityText.leadingAnchor, constant: 0),
            windSpeedLabel.topAnchor.constraint(equalTo: windDirectionLabel.bottomAnchor, constant: 10),
            windSpeedLabel.leadingAnchor.constraint(equalTo: visibilityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupSunset() {
        addSubview(sunsetText)
        addSubview(sunsetLabel)
        sunsetText.translatesAutoresizingMaskIntoConstraints = false
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunsetText.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 20),
            sunsetText.leadingAnchor.constraint(equalTo: windDirectionLabel.leadingAnchor, constant: 0),
            sunsetLabel.topAnchor.constraint(equalTo: sunsetText.bottomAnchor, constant: 10),
            sunsetLabel.leadingAnchor.constraint(equalTo: windSpeedLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupLocate() {
        addSubview(locateButton)
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
    
    
    func setupForcastCollectionView() {
        addSubview(forcastCollectionView)
        forcastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forcastCollectionView.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: 40),
            forcastCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            forcastCollectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 5),
            forcastCollectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
    }
}
