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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        
        setDelegates()
        setupView()
        setContrains()
    }
    
    private func setDelegates() {
        
        
    }
    
    private func setupView() {
        
        view.addSubview(launchTableView)
    }
    private func setContrains() {
        
        
    }

}

extension LaunchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

extension LaunchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
}
