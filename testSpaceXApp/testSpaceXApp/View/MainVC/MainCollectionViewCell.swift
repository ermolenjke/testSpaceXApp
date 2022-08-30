//
//  TestCollectionViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 18.08.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dataView = DataView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .black
        
        addSubview(scrollView)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(dataView)
       
    }
    
    func cellConfigure(model: RocketData) {
        dataView.rocketNameLabel.text = model.nameLabel
        rocketImageView.image = model.image
    }
    
    private func setConstraints() {
      
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            rocketImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            rocketImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            rocketImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -70),
            dataView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            dataView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            dataView.heightAnchor.constraint(equalToConstant: 870),
            dataView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
        
    }
}

