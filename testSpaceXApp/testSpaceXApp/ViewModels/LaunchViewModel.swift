//
//  LaunchViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 06.09.2022.
//

import Foundation

struct LaunchViewModel {
    
    var launches: Launch
    
    var name: String {
        return launches.name
    }
    
    var date: String {
        return launches.date_utc.getFormattedDateString(oldFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", newFormat: "d MMMM, yyyy")
    }
    
    var picture: String {
        return launches.success! ? Pictures.success.rawValue : Pictures.failure.rawValue
    }
}

