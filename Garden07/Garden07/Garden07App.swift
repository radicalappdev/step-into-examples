//
//  Garden07App.swift
//  Garden07
//
//  Created by Joseph Simpson on 9/30/24.
//

import SwiftUI

@main
struct Garden07App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)


        WindowGroup(id: "🌸") {
            Flower01Scene()
                .environment(appModel)
        }
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.trailing(mainWindow))
            }
            return WindowPlacement(.none)
        }
    }
}
