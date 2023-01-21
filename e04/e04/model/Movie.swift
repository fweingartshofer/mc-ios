//
//  Movie.swift
//  e04
//
//  Created by Florian Weingartshofer on 18.01.23.
//

import Foundation

struct Movie : Codable, Identifiable {
    var id: Int
    var title: String
    var openingCrawl: String
    var director: String
    var producer: String
    var releaseDate: String
    var characters: Array<String>
    var planets: Array<String>
    var starships: Array<String>
    var vehicles: Array<String>
    var species: Array<String>
    var created: String
    var edited: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case title, director, producer, characters, planets, starships, vehicles, species, created, edited, url, releaseDate, openingCrawl
        case id = "episodeId"
    }
}
