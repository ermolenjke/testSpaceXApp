//
//  SettingsViewController.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsLabel = UILabel(text: "Настройки")
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Закрыть", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Resources.Colors.specialGray
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var horizontalLabelsStack = UIStackView()
    private let idSettingsTableViewCell = "idSettingsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resources.Colors.specialGray
        
        setDelegates()
        setupViews()
        setContrains()
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: idSettingsTableViewCell)
    }
    
    @objc private func closeVC() {
        dismiss(animated: true)
    }
    
    private func setDelegates() {

        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
    
    private func setupViews() {
        
        horizontalLabelsStack = UIStackView(arrangedSubviews: [settingsLabel, closeButton],
                                            axis: .horizontal,
                                            spacing: 10)
        view.addSubview(horizontalLabelsStack)
        view.addSubview(settingsTableView)
    }
    private func setContrains() {
        
        NSLayoutConstraint.activate([
            horizontalLabelsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            horizontalLabelsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
            horizontalLabelsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            horizontalLabelsStack.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: horizontalLabelsStack.bottomAnchor, constant: 60),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: idSettingsTableViewCell, for: indexPath) as! SettingsTableViewCell
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


