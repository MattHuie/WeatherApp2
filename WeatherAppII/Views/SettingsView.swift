import UIKit

class SettingsView: UIView {
    
    public lazy var segmentedControlTemp: UISegmentedControl = {
        let segment = UISegmentedControl.init(frame: self.bounds)
        segment.insertSegment(withTitle: "Fahrenheit", at: 0, animated: true)
        segment.insertSegment(withTitle: "Celcius", at: 1, animated: true)
        return segment
    }()
    
    public lazy var tempuratureLabel: UILabel = {
        let label = UILabel.init(frame: self.bounds)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        setupView()
    }
    
}

extension SettingsView {
    private func setupView() {
        setupSegmentedControlTemp()
    }
    
    private func setupSegmentedControlTemp() {
        addSubview(segmentedControlTemp)
        segmentedControlTemp.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setupLabel() {
        addSubview(tempuratureLabel)
        tempuratureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
}
