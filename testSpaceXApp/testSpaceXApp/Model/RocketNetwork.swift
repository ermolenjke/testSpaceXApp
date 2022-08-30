//
//  RocketNetwork.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 30.08.2022.
//

import Foundation

struct RocketNetwork: Codable {
    
    let success: Bool?
    let name: String
    let rocket: Rocket
    let date_utc: String
    
    var date: String {
            return date_utc.getFormattedDateString(oldFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", newFormat: "d MMMM, yyyy")
        }
}
