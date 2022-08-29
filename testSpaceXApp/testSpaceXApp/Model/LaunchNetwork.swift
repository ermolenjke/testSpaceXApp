//
//  File.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 22.08.2022.
//

import UIKit


struct LaunchNetwork: Codable {
    
    let success: Bool?
    let name: String
    let rocket: Rocket
    let date_utc: String
    
    var date: String {
            return date_utc.getFormattedDateString(oldFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", newFormat: "d MMMM, yyyy")
        }
}

enum Rocket: String, Codable {

    case the5E9D0D95Eda69955F709D1Eb = "5e9d0d95eda69955f709d1eb"  // falcon1
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"  // falcon9
    case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"  // falconHeavy
}

