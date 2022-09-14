//
//  LaunchModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

struct LaunchModel: Decodable {
    let rocketId, name, dateLocal: String
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case rocketId = "rocket"
        case name
        case dateLocal = "date_local"
        case success
    }
}

