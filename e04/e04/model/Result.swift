//
//  MovieModel.swift
//  e04
//
//  Created by Florian Weingartshofer on 12.01.23.
//

import Foundation


struct Result<T: Codable>: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [T]
}
