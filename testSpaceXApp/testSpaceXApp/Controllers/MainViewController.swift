//
//  ViewController.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "falcon9")
        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let dataView = DataView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        setupView()
        setConstrains()
    }
    
    private func setupView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(dataView)
    }
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 140),
            rocketImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            rocketImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            rocketImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -60),
            dataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            dataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            dataView.heightAnchor.constraint(equalToConstant: 1000),
            dataView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
}
