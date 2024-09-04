//
//  Garden05App.swift
//  Garden05
//
//  Created by Joseph Simpson on 8/14/24.
//

import SwiftUI

@main
struct Garden05App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup(id: "SplashScreen") {
            SplashScreen()
        }
        .defaultSize(width: 500, height: 500)


        WindowGroup(id: "MainWindow") {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)

        // Garden Windows
        WindowGroup(id: "FlowerPicker") {
            FlowerPicker()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)
      
    }
}


