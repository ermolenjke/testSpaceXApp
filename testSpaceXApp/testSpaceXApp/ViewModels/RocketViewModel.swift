//
//  RocketViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 05.09.2022.
//

import UIKit

struct RocketViewModel {
    
    var rockets: Rocket
    let defaults = UserDefaults.standard
    
    // MARK: - imageview
    
    var name: String? {
        return rockets.name
    }
    
    var id: String? {
        return rockets.id
    }
    
    var imageURL: String? {
        return rockets.flickr_images.randomElement()!
    }
    
    // MARK: - Cell
    
    var heighValue: [String]? {
        switch defaults.integer(forKey: Settings.heigh.rawValue) {
        case 0:
            return [String(format: "%g" ,rockets.height.meters!), "Высота, m"]
        default:
            return [String(format: "%g", rockets.height.feet!), "Высота, ft"]
        }
    }
    
    var diameterValue: [String]? {
        switch defaults.integer(forKey: Settings.diameter.rawValue) {
        case 0:
            return [String(format: "%g", rockets.diameter.meters!), "Диаметр, m"]
        default:
            return [String(format: "%g", rockets.diameter.feet!), "Диаметр, ft"]
        }
    }
    
    var massValue: [String]? {
        switch defaults.integer(forKey: Settings.weight.rawValue) {
        case 0:
            return [rockets.mass.kg!.formattedWithSeparator, "Масса, kg"]
        default:
            return [rockets.mass.lb!.formattedWithSeparator, "Масса, lb"]
        }
    }
    
    var payloadValue: [String]? {
        let payload = rockets.payload_weights.filter { $0.id == "leo"}.first!
        
        switch defaults.integer(forKey: Settings.payload.rawValue) {
        case 0:
            return [payload.kg!.formattedWithSeparator, "Нагрузка, kg"]
        default:
            return [payload.lb!.formattedWithSeparator, "Нагрузка, lb"]
        }
    }
    
    // MARK: - Info
    
    var firstFlight: String? {
        return rockets.first_flight.getFormattedDateString(oldFormat: "yyyy-MM-dd", newFormat: "d MMMM, yyyy")
    }
    
    var country: String? {
        return rockets.country
    }
    
    var costPerLaunch: String? {
        return "$\(String(rockets.cost_per_launch / 1000000)) млн"
    }
    
    var firstStageEng: NSAttributedString? {
        if let fsEngines = rockets.first_stage.engines {
            return NSAttributedString.setTwoColorsString(str1: String(fsEngines))
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
    
    var firstStageFuel: NSAttributedString? {
        if let fsFuel = rockets.first_stage.fuel_amount_tons {
            return NSAttributedString.setTwoColorsString(str1: String(format: "%g", fsFuel), str2: "ton")
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
    
    var firstStageBurnTime: NSAttributedString? {
        if let time = rockets.first_stage.burn_time_sec {
            return NSAttributedString.setTwoColorsString(str1: String(time), str2: "sec")
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
    
    var secondStageEng: NSAttributedString? {
        if let ssEngines = rockets.second_stage.engines {
            return NSAttributedString.setTwoColorsString(str1: String(ssEngines))
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
    
    var secondStageFuel: NSAttributedString? {
        if let ssFuel = rockets.second_stage.fuel_amount_tons {
            return NSAttributedString.setTwoColorsString(str1: String(format: "%g", ssFuel), str2: "ton")
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
    
    var secondStageBurnTime: NSAttributedString? {
        if let time = rockets.second_stage.burn_time_sec {
            return NSAttributedString.setTwoColorsString(str1: String(time), str2: "sec")
        } else {
            return NSAttributedString(string: "нет данных")
        }
    }
}


