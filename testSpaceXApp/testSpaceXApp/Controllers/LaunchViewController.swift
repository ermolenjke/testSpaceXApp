//
//  LaunchViewController.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    private let launchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellow
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idLaunchTableViewCell = "idLaunchTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        setDelegates()
        setupViews()
        setContrains()
        launchTableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: idLaunchTableViewCell)
    }
    
    private func setDelegates() {
        
        launchTableView.delegate = self
        launchTableView.dataSource = self
    }
    
    private func setupViews() {
        
        view.addSubview(launchTableView)
    }
    private func setContrains() {
        
        NSLayoutConstraint.activate([
            launchTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            launchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            launchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            launchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

extension LaunchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = launchTableView.dequeueReusableCell(withIdentifier: idLaunchTableViewCell, for: indexPath) as! LaunchTableViewCell
        return cell
    }
}

extension LaunchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
