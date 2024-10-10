//
//  Garden10App.swift
//  Garden10
//
//  Created by Joseph Simpson on 10/10/24.
//

import SwiftUI

@main
struct Garden10App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup(id: "SplashScreen") {
            SplashScreen()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: "MainWindow") {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)

    }
}
