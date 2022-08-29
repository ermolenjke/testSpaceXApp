//
//  LaunchTableViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.08.2022.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

     let backgroundCell: UIView = {
           let view = UIView()
            view.layer.cornerRadius = 30
            view.backgroundColor = Resources.Colors.specialGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
     let launchNameLabel: UILabel = {
            let label = UILabel()
            label.text = "FalconSat"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
     let dateLaunchLabel: UILabel = {
            let label = UILabel()
            label.text = "2 февраля, 2022"
            label.textColor = Resources.Colors.specialLightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
     let statusLaunchImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .clear
            imageView.image = UIImage(systemName: "checkmark.seal.fill")
            imageView.tintColor = .green
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    private var verticalDataLaunchStack = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setupViews()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func cellConfigure(model: LaunchNetwork) {
        launchNameLabel.text = model.name
        dateLaunchLabel.text = model.date
        
        if model.success == true {
            statusLaunchImageView.tintColor = .green
        } else {
            statusLaunchImageView.tintColor = .red
        }
    }
    
    private func setupViews() {
            
            backgroundColor = .black
            selectionStyle = .none
        
        addSubview(backgroundCell)
        
        verticalDataLaunchStack = UIStackView(arrangedSubviews: [launchNameLabel, dateLaunchLabel],
                                            axis: .vertical,
                                            spacing: 10)
//        verticalDataLaunchStack.distribution =
                addSubview(verticalDataLaunchStack)
        addSubview(statusLaunchImageView)
        
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            verticalDataLaunchStack.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 34),
            verticalDataLaunchStack.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 24),
            verticalDataLaunchStack.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -100),
            verticalDataLaunchStack.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -28)
        ])
        
        NSLayoutConstraint.activate([
            statusLaunchImageView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 37),
            statusLaunchImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            statusLaunchImageView.heightAnchor.constraint(equalToConstant: 40),
            statusLaunchImageView.widthAnchor.constraint(equalToConstant: 46)
        ])
    }
}
