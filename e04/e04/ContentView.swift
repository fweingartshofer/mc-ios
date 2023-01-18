//
//  ContentView.swift
//  e04
//
//  Created by Florian Weingartshofer on 12.01.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isFetching: Bool = true
    @State private var movies: [Movie] = []
    @State private var planets: [Planet] = []
    private var network = Network()
    
    var body: some View {
        NavigationStack {
            if isFetching {
                ProgressView("Fetching Movies")
            } else{
                List(movies){movie in
                    NavigationLink(movie.title) {
                        MovieDetailView(movie: movie, planets: planetsForMovie(movie))
                    }
                }
            }
        }
        .navigationTitle("Products")
        .task {
            do {
                movies = try await network.fetchMovies()
                planets = try await network.fetchPlanets()
                isFetching = false
            } catch {
                print("Error while fetching movies", error)
            }
        }
    }
    
    private func planetsForMovie(_ movie: Movie) -> [Planet] {
        var res: [Planet] = []
        for planet in movie.planets {
            if let p = planets.first(where: { $0.url == planet }) {
                res.append(p)
            }
        }
        return res
    }
}
