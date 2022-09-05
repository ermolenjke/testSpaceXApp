//
//  API.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 05.09.2022.
//

import Foundation

enum API {
    case rockets
    case launchec
    
    var url: URL {
        switch self {
        case .rockets:
            return URL(string: "https://api.spacexdata.com/v4/rockets")!
        case .launchec:
            return URL(string: "https://api.spacexdata.com/v4/launches")!
        }
    }
}
