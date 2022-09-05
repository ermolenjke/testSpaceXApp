//
//  RocketNetwork.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 30.08.2022.
//

import Foundation

struct Rocket: Codable {
    
    let id: String
    let description: String
    let wikipedia: String
    
    // MARK: - MainImage
    
    let name: String
    let flickr_images: [String]
    
    // MARK: - Cell
    
    let height: Height
    let diameter: Diameter
    let mass: Weight
    let payload_weights: [Payload]
    
    // MARK: - Description
    
    let first_flight: String
    let country: String
    let cost_per_launch: Int
    let first_stage: Stage
    let second_stage: Stage
}

struct Height: Codable {
    let meters: Double?
    let feet: Double?
}

struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

struct Weight: Codable {
    let kg: Double?
    let lb: Double?
}

struct Payload: Codable {
    let id: String?
    let kg: Double?
    let lb: Double?
}

struct Stage: Codable {
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}
