//
//  Garden11App.swift
//  Garden11
//
//  Created by Joseph Simpson on 11/4/24.
//

import SwiftUI

@main
struct Garden11App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                
        }
        .windowStyle(.volumetric)

    }
}
