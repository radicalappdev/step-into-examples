//
//  Garden09App.swift
//  Garden09
//
//  Created by Joseph Simpson on 10/9/24.
//

import SwiftUI

@main
struct Garden09App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)

        WindowGroup(id: "VolumeLeading") {
            Box()
        }
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.leading(mainWindow))
            }
            return WindowPlacement(.none)
        }

    }
}
