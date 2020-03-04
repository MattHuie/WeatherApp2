
import UIKit

class WeatherMainScrollView: UIScrollView {

    lazy var mainContainer: UIView = {
        let view = UIView()
        return view
    }()
    lazy var mainStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.backgroundColor = .green
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
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.contentSize = CGSize(width: 400, height: 2000)
            setupMainScrollView()
            setupCityState()
    //        setupTemperature()
    //        setupWeather()
    //        setupFeelsLike()
    //        setupHumidity()
    //        setupWindDirection()
    //        setupVisibility()
    //        setupSunrise()
    //        setupSunset()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    func setupMainScrollView(){
//        addSubview(mainContainer)
//        mainContainer.addSubview(mainStackView)
//        mainContainer.translatesAutoresizingMaskIntoConstraints = false
//        mainStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            mainContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            mainContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//            mainContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
//            mainContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 400),
//            mainStackView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
//            mainStackView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
//            mainStackView.topAnchor.constraint(equalTo: mainContainer.topAnchor),
//            mainStackView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
//        ])
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func setupCityState() {
        mainStackView.addSubview(cityLabel)
        mainStackView.addSubview(stateLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            cityLabel.heightAnchor.constraint(equalToConstant: 700),
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            stateLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor, constant: 5),
            stateLabel.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
}
