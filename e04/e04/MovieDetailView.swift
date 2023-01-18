//
//  MovieDetailView.swift
//  e04
//
//  Created by Florian Weingartshofer on 12.01.23.
//

import SwiftUI

struct MovieDetailView: View {
    @State var movie: Movie
    @State var planets: [Planet] = []
    var network = Network()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Producer: \(movie.producer)")
                    Text("Director: \(movie.director)")
                    Text("Release Date: \(movie.releaseDate)")
                    Text("Created On: \(movie.created)")
                    Text("Edited On: \(movie.edited)")
                } header: {
                    Text("Movie Meta Data")
                }
                Section {
                    Text("# of Characters: \(movie.characters.count)")
                    Text("# of Starships: \(movie.starships.count)")
                    Text("# ofVehicles: \(movie.vehicles.count)")
                } header: {
                    Text("Facts")
                }
                Section {
                    ForEach(planets) { planet in
                        /*@START_MENU_TOKEN@*/Text(planet.id)/*@END_MENU_TOKEN@*/
                    }
                } header: {
                    Text("Planets")
                }
            }
        }
        .navigationBarTitle(movie.title).onAppear {
            print(planets)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(id: 1, title: "Test", openingCrawl: "Bla", director: "bla", producer: "Bla", releaseDate: "1900-1-1", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "1900-1-1", edited: "1900-1-1", url: ""))
    }
}
