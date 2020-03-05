//
//  HourlyCollectionViewCell.swift
//  WeatherAppII
//
//  Created by Biron Su on 3/5/20.
//  Copyright © 2020 Matthew Huie. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    lazy var hourWeatherImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        return label
    }()
        
    lazy var hourTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
        
    lazy var hourHighLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var hourLowLabel: UILabel = {
        let label = UILabel()
        return label
    }()
        
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        commonInit()
    }
           
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        
    private func commonInit(){
        setupHourLabel()
        setupHourTempLabel()
        setupHourHighLabel()
        setupHourLowLabel()
        setupWeatherImageLabel()
    }
    func setupHourLabel(){
        addSubview(hourLabel)
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hourLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            hourLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            hourLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
        ])
    }
        
    func setupHourTempLabel(){
        addSubview(hourTempLabel)
        hourTempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourTempLabel.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 10),
            hourTempLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            hourTempLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
        ])
    }
        
    func setupHourHighLabel(){
        addSubview(hourHighLabel)
        hourHighLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourHighLabel.topAnchor.constraint(equalTo: hourTempLabel.bottomAnchor, constant: 10),
            hourHighLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hourHighLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            hourHighLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
        ])
    }
        
    func setupHourLowLabel(){
        addSubview(hourLowLabel)
        hourLowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourLowLabel.topAnchor.constraint(equalTo: hourHighLabel.bottomAnchor, constant: 10),
            hourLowLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hourLowLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            hourLowLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
        ])
    }
        
    func setupWeatherImageLabel(){
        addSubview(hourWeatherImage)
        hourWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hourWeatherImage.topAnchor.constraint(equalTo: hourLowLabel.bottomAnchor, constant: 10),
            hourWeatherImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hourWeatherImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            hourWeatherImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10),
            hourWeatherImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
