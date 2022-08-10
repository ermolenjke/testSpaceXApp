//
//  DataView.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

class DataView: UIView {
    
    
    private let settingsButton: UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = .clear
            button.setImage(UIImage(systemName: "gearshape"), for: .normal)
            button.layer.cornerRadius = 20
            button.tintColor = .white
            button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    let rocketNameLabel: UILabel = {
           let label = UILabel()
            label.text = "NAME"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var topStackView = UIStackView()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            layer.cornerRadius = 20
            backgroundColor = .black
            translatesAutoresizingMaskIntoConstraints = false
            
            setupViews()
            setConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func settingsButtonTapped() {
        print("tapped")
    }
    
    private func setupViews() {
        
        topStackView = UIStackView(arrangedSubviews: [rocketNameLabel, settingsButton],
                                            axis: .horizontal,
                                            spacing: 10)
                addSubview(topStackView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            topStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
