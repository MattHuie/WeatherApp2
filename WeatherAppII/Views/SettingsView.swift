import UIKit

class SettingsView: UIView {
    
    public lazy var segmentedControlTemp: UISegmentedControl = {
        let segment = UISegmentedControl.init(frame: self.bounds)
        segment.insertSegment(withTitle: "Fahrenheit", at: 0, animated: true)
        segment.insertSegment(withTitle: "Celcius", at: 1, animated: true)
        segment.backgroundColor = .black
        return segment
    }()
    
    public lazy var tempuratureLabel: UILabel = {
        let label = UILabel.init(frame: self.bounds)
        label.text = "Temperature Type"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    public lazy var locationsButton: UIButton = {
        let button = UIButton.init(frame: self.bounds)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Add Places", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupView()
    }
    
}

extension SettingsView {
    private func setupView() {
        setupLabel()
        setupSegmentedControlTemp()
        setupLocationsButton()
    }
    
    private func setupLabel() {
        addSubview(tempuratureLabel)
        tempuratureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tempuratureLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            tempuratureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            tempuratureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
            tempuratureLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupSegmentedControlTemp() {
        addSubview(segmentedControlTemp)
        segmentedControlTemp.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControlTemp.topAnchor.constraint(equalTo: tempuratureLabel.bottomAnchor, constant: 10),
            segmentedControlTemp.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            segmentedControlTemp.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    private func setupLocationsButton() {
        addSubview(locationsButton)
        locationsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationsButton.topAnchor.constraint(equalTo: segmentedControlTemp.bottomAnchor, constant: 40),
            locationsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            locationsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
