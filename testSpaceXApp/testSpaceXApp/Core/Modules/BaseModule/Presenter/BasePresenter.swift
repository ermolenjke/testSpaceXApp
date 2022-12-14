//
//  BasePresenter.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

import Foundation

protocol BasePresenterProtocol {
    init(view: BaseViewProtocol,
         dataManager: DataManagerProtocol,
         networkManager: NetworkManagerProtocol)
    func fetchPages()
}

final class BasePresenter: BasePresenterProtocol {
    
    // MARK: - Properties
    weak var view: BaseViewProtocol!
    unowned let dataManager: DataManagerProtocol!
    let networkManager: NetworkManagerProtocol!
    
    // MARK: - Init
    init(view: BaseViewProtocol,
         dataManager: DataManagerProtocol,
         networkManager: NetworkManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
        self.networkManager = networkManager
    }
    
    // MARK: - Methods
    func fetchPages() {
        guard let url = URL(string: APIs.rockets) else { return }
        networkManager.request(fromURL: url) { (result: Result<[RocketModel], Error>) in
            switch result {
            case .success(let rockets):
                self.dataManager.setRockets(rockets)
                self.view.success(withNumber: rockets.count)
            case .failure(let error):
                self.view.failure(error: error)
            }
        }
    }
}
