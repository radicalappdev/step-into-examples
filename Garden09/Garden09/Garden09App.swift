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
    }
}
