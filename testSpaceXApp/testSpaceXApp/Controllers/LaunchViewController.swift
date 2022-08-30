//
//  LaunchViewController.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    private let settingsLabel = UILabel(text: "Настройки")
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Закрыть", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let launchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idLaunchTableViewCell = "idLaunchTableViewCell"
    private var horizontalLabelsStack = UIStackView()
    private var launches = [LaunchNetwork]()
    private var falcon1Array = [LaunchNetwork]()
    private var falcon9Array = [LaunchNetwork]()
    private var falconHeavyArray = [LaunchNetwork]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setDelegates()
        setupViews()
        setContrains()
        launchTableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: idLaunchTableViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getLaunch()
        launchTableView.reloadData()
    }
    
    @objc private func closeVC() {
        dismiss(animated: true)
    }
    
    private func getLaunch() {
        
        NetworkDataFetch.shared.fetchLaunch { model, error in
            guard let launch = model else { return }
            self.launches = launch
            print(self.launches)
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            
//            for launch in self.launches {
//
//                if launch.rocket.rawValue == "5e9d0d95eda69955f709d1eb" {
//                    self.falcon1Array.append(launch)
//                    print(self.falcon1Array)
//                }
//
//            }
            
        }
    }
    
    private func setDelegates() {
        
        launchTableView.delegate = self
        launchTableView.dataSource = self
    }
    
    private func setupViews() {
        
        horizontalLabelsStack = UIStackView(arrangedSubviews: [settingsLabel, closeButton],
                                            axis: .horizontal,
                                            spacing: 10)
        view.addSubview(horizontalLabelsStack)
        view.addSubview(launchTableView)
    }
    private func setContrains() {
        
        NSLayoutConstraint.activate([
            horizontalLabelsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            horizontalLabelsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
            horizontalLabelsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            horizontalLabelsStack.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            launchTableView.topAnchor.constraint(equalTo: horizontalLabelsStack.bottomAnchor, constant: 20),
            launchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            launchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            launchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

extension LaunchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = launchTableView.dequeueReusableCell(withIdentifier: idLaunchTableViewCell, for: indexPath) as! LaunchTableViewCell
        let model = launches[indexPath.row]
        
        cell.cellConfigure(model: model)
        return cell
    }
}

extension LaunchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

