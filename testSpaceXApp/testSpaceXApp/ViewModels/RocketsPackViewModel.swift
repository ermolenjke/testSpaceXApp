//
//  RocketsPackViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 05.09.2022.
//

import Foundation

import Foundation

class RocketsPackViewModel {
    var rocketPack = [RocketViewModel]()
    
    func getRockets(completion: @escaping ([RocketViewModel]) -> Void) {
        NetworkManager.shared.getRockets { (rockets) in
            guard let rockets = rockets else {
                return
            }
            
            let rocketPack = rockets.map(RocketViewModel.init)
            DispatchQueue.main.async {
                self.rocketPack = rocketPack
                completion(rocketPack)
            }
        }
    }
}
