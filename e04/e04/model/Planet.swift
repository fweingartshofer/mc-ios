//
//  Planet.swift
//  e04
//
//  Created by Florian Weingartshofer on 18.01.23.
//

import Foundation


struct Planet: Codable, Identifiable {
    var id: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case rotationPeriod, orbitalPeriod, diameter, climate, gravity, terrain, surfaceWater, population, residents, films, created, edited, url
        case id = "name"
    }
}
