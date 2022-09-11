//
//  LaunchViewModelPack.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 06.09.2022.
//

import Foundation

class LaunchPackViewModel {
    var launchPack = [LaunchViewModel]()
    
    func getLaunch(_ rocket: String, completion: @escaping ([LaunchViewModel]) -> Void) {
        NetworkManager.shared.getLaunches(rocket) { (launch) in
            guard let launch = launch else {
                return
            }
            
            let launchPack = launch.map(LaunchViewModel.init)
            DispatchQueue.main.async {
                self.launchPack = launchPack
                completion(launchPack)
            }
        }
    }
}
