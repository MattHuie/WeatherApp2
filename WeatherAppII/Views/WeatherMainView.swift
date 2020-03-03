import UIKit

class WeatherMainView: UIView {
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperature Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "WindSpeed Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.text = "FeelsLike Label"
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
    lazy var windDirectionLabel: UILabel = {
        let label = UILabel()
        label.text = "WindDirection Label"
        label.backgroundColor = .white
        return label
    }()
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise Label"
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
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        setupTemperature()
        setupHumidity()
        setupWindSpeed()
        setupFeelsLike()
        setupVisibility()
        setupWeather()
        setupWindDirection()
        setupSunrise()
        setupSunset()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTemperature() {
        addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            temperatureLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    func setupHumidity() {
        addSubview(humidityLabel)
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            humidityLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupWindSpeed() {
        addSubview(windSpeedLabel)
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeedLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 10),
            windSpeedLabel.leadingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupFeelsLike() {
        addSubview(feelsLikeLabel)
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feelsLikeLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 10),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: windSpeedLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupVisibility() {
        addSubview(visibilityLabel)
        visibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visibilityLabel.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: 10),
            visibilityLabel.leadingAnchor.constraint(equalTo: feelsLikeLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupWeather() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: visibilityLabel.bottomAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: visibilityLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupWindDirection() {
        addSubview(windDirectionLabel)
        windDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 10),
            windDirectionLabel.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupSunrise() {
        addSubview(sunriseLabel)
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunriseLabel.topAnchor.constraint(equalTo: windDirectionLabel.bottomAnchor, constant: 10),
            sunriseLabel.leadingAnchor.constraint(equalTo: windDirectionLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupSunset() {
        addSubview(sunsetLabel)
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 10),
            sunsetLabel.leadingAnchor.constraint(equalTo: sunriseLabel.leadingAnchor, constant: 0)
        ])
    }
    func setupLocate() {
        addSubview(locateButton)
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
}

