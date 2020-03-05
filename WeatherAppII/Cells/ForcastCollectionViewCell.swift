//
//  ForcastCollectionViewCell.swift
//  WeatherAppII
//
//  Created by Jason on 3/5/20.
//  Copyright © 2020 Matthew Huie. All rights reserved.
//

import UIKit

class ForcastCollectionViewCell: UICollectionViewCell {
    
    lazy var weatherImage: UIImageView = {
           let image = UIImageView()
           return image
       }()
    lazy var dayOfTheWeekLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var numericDayValuelabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var lowTempLabel: UILabel = {
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
    
    
    
    func commonInit(){
        dayOfTheWeekLabelSetup()
        numericDayValuelabelSetup()
        highTempLabelSetup()
        lowTempLabelSetup()
        weatherImageSetup()
    }
    
    
    
    func dayOfTheWeekLabelSetup(){
        addSubview(dayOfTheWeekLabel)
        dayOfTheWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayOfTheWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            dayOfTheWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            dayOfTheWeekLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            dayOfTheWeekLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)
        ])
    }
    
    func numericDayValuelabelSetup(){
        addSubview(numericDayValuelabel)
        numericDayValuelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numericDayValuelabel.topAnchor.constraint(equalTo: dayOfTheWeekLabel.bottomAnchor, constant: 10),
//            numericDayValuelabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numericDayValuelabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            numericDayValuelabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)
        ])
    }
    
    func highTempLabelSetup(){
        addSubview(highTempLabel)
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highTempLabel.topAnchor.constraint(equalTo: numericDayValuelabel.bottomAnchor, constant: 10),
            highTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            highTempLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            highTempLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)
        ])
    }
    
    func lowTempLabelSetup(){
        addSubview(lowTempLabel)
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 10),
            lowTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lowTempLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            lowTempLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)
        ])
    }
    
    func weatherImageSetup(){
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor, constant: 10),
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            weatherImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 10),
            weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
