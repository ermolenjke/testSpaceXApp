//
//  TestCollectionViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 18.08.2022.
//

import UIKit

class MainVC: UIViewController {
    
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
    
    var pageIndex = 0
    let dataView = DataView()
    var viewModel = RocketsPackViewModel()
    var rocket: RocketViewModel? {
        didSet {
            updateValues()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRockets()
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(dataView)
       
    }
    
//    func cellConfigure(model: RocketData) {
//        dataView.rocketNameLabel.text = model.nameLabel
//        rocketImageView.image = model.image
//    }
    
    private func setDelegates() {
        
        dataView.showLaunchVCDelegate = self
        dataView.showSettingsVCDelgate = self
    }
    
    func getRockets() {
        viewModel.getRockets { _ in
           
            self.dataView.rocket = self.viewModel.rocketPack[self.pageIndex]
            self.rocket = self.viewModel.rocketPack[self.pageIndex]
//            self.infoScrollView.rocket = self.viewModel.rocketPack[self.pageIndex]
//            self.descriptionScrollView.rocket = self.viewModel.rocketPack[self.pageIndex]
        }
    }
    
    func updateValues() {
        if let rocket = rocket {
            dataView.rocketNameLabel.text = rocket.name
            
            if let url = rocket.imageURL {
                NetworkManager.shared.getImage(urlString: url) { data in
                    guard let data = data else { return }
                    
                    DispatchQueue.main.async {
                        self.rocketImageView.image = UIImage(data: data)
                    }
                }
            } else {
                self.rocketImageView.image = UIImage(systemName: Pictures.noConnection.rawValue)
            }
        }
    }
    
    
    private func setConstraints() {
      
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -60),
            rocketImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            rocketImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            rocketImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -70),
            dataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            dataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            dataView.heightAnchor.constraint(equalToConstant: 880),
            dataView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
        
    }
}

extension MainVC: ShowLaunchVCProtocol, ShowSettingsVCProtocol {
    
    func settingsButtonTapped() {
        
        
    }
    
    func buttonTapped() {
       
        let vc = LaunchViewController()
        vc.rocket = viewModel.rocketPack[self.pageIndex].id ?? "false"
        vc.settingsLabel.text = viewModel.rocketPack[self.pageIndex].name
        self.present(vc, animated: true)
    }
}

