import UIKit

class WeatherMainView: UIView {
    
    lazy var mainScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .blue
        scrollview.contentSize = CGSize.init(width: 400, height: 4000)
        scrollview.isScrollEnabled = true
        scrollview.isUserInteractionEnabled = true
        return scrollview
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.backgroundColor = .black
        stackview.isUserInteractionEnabled = false
        return stackview
    }()
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
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        setupMainScrollView()
        setupCityState()
        setupTemperature()
        setupWeather()
        setupFeelsLike()
        setupHumidity()
        setupWindDirection()
        setupVisibility()
        setupSunrise()
        setupSunset()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupMainScrollView(){
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainScrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 400),
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor)
        ])
    }
    func setupCityState() {
        mainScrollView.addSubview(cityLabel)
        mainScrollView.addSubview(stateLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 10),
            cityLabel.heightAnchor.constraint(equalToConstant: 700),
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            stateLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor, constant: 5),
            stateLabel.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    func setupTemperature() {
        addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -250),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 150),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupWeather() {
        mainScrollView.addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            weatherLabel.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor, constant: 0)
        ])
    }
    func setupFeelsLike() {
        mainScrollView.addSubview(feelsLikeText)
        mainScrollView.addSubview(feelsLikeLabel)
        feelsLikeText.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feelsLikeText.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            feelsLikeText.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 10),
            feelsLikeLabel.topAnchor.constraint(equalTo: feelsLikeText.bottomAnchor, constant: 10),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeText.leadingAnchor, constant: 5)
        ])
    }
    func setupHumidity() {
        mainScrollView.addSubview(humidityText)
        mainScrollView.addSubview(humidityLabel)
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
        mainScrollView.addSubview(windDirectionLabel)
        mainScrollView.addSubview(windSpeedLabel)
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
        mainScrollView.addSubview(visibilityText)
        mainScrollView.addSubview(visibilityLabel)
        visibilityText.translatesAutoresizingMaskIntoConstraints = false
        visibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visibilityText.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            visibilityText.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor, constant: 50),
            visibilityLabel.topAnchor.constraint(equalTo: visibilityText.bottomAnchor, constant: 10),
            visibilityLabel.leadingAnchor.constraint(equalTo: visibilityText.leadingAnchor, constant: 5)
        ])
    }
    func setupSunrise() {
        mainScrollView.addSubview(sunriseText)
        mainScrollView.addSubview(sunriseLabel)
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
        mainScrollView.addSubview(sunsetText)
        mainScrollView.addSubview(sunsetLabel)
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
        mainScrollView.addSubview(locateButton)
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
}


