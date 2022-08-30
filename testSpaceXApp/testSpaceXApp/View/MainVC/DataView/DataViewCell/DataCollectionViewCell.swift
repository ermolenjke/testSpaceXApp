//
//  DataCollectionViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 30.08.2022.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    private let dataMeasureLabel = UILabel(text: "3000")
    
    private let measureLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота, ft"
        label.textColor = Resources.Colors.specialLightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var verticalMeasureStack = UIStackView()
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupView()
            setConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        dataMeasureLabel.textAlignment = .center
        
        backgroundColor = Resources.Colors.specialGray
        layer.cornerRadius = 30
        
        verticalMeasureStack = UIStackView(arrangedSubviews: [dataMeasureLabel, measureLabel],
                                            axis: .vertical,
                                            spacing: 10)
        verticalMeasureStack.distribution = .fillEqually
        addSubview(verticalMeasureStack)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            verticalMeasureStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            verticalMeasureStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            verticalMeasureStack.heightAnchor.constraint(equalToConstant: 70),
            verticalMeasureStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
