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
    
    private let showLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Resources.Colors.specialGray
        button.layer.cornerRadius = 10
        button.setTitle("Посмотреть запуски", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(showLaunchesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var topStackView = UIStackView()
    private var navBAr = NavigationViewController()
    
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
        
    }
    
    @objc private func showLaunchesButtonTapped() {
        
        let launchVC = LaunchViewController()
        navBAr.pushViewController(launchVC, animated: true)
        
        
    }
    
    private func setupViews() {
        
        topStackView = UIStackView(arrangedSubviews: [rocketNameLabel, settingsButton],
                                            axis: .horizontal,
                                            spacing: 10)
        topStackView.distribution = .equalSpacing
                addSubview(topStackView)
        addSubview(showLaunchesButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            topStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            showLaunchesButton.topAnchor.constraint(equalTo: topStackView.topAnchor, constant: 50),
            showLaunchesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            showLaunchesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            showLaunchesButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
