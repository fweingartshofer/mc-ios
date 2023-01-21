//
//  e05App.swift
//  e05
//
//  Created by Florian Weingartshofer on 21.01.23.
//

import SwiftUI

@main
struct e05App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StudentListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
