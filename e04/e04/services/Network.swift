//
//  Network.swift
//  e04
//
//  Created by Florian Weingartshofer on 12.01.23.
//

import Foundation

class Network {
    
    private static var API_BASE_URL = "https://swapi.dev/api"
    
    func fetchMovies() async throws -> [Movie] {
        (try await fetch("\(Network.API_BASE_URL)/films") as Result<Movie>).results
    }
    
    func fetchPlanets() async throws -> [Planet] {
        (try await fetch("\(Network.API_BASE_URL)/planets") as Result<Planet>).results
    }
    
    func fetchPlanet(_ url: String) async throws -> Planet {
        try await fetch(url) as Planet
    }
    
    private func fetch<T: Codable>(_ url: String) async throws -> T {
        let session = URLSession.shared
        
        guard let url = URL(string: url) else {
            throw APIError("Could not create URL")
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError("The server responded with an error.")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode(T.self, from: data) else {
            throw APIError("The server response was not recognized.")
        }
        return result
    }
}

struct APIError: Error {
    private let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        message
    }
}
