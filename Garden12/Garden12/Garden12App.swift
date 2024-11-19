//
//  Garden12App.swift
//  Garden12
//
//  Created by Joseph Simpson on 11/19/24.
//

import SwiftUI

@main
struct Garden12App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 600, height: 600))

        // Give the space an ID and a view
        ImmersiveSpace(id: "GardenScene") {
            ImmersiveView()
        }
    }
}
