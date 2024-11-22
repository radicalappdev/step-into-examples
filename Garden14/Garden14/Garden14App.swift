//
//  Garden14App.swift
//  Garden14
//
//  Created by Joseph Simpson on 11/22/24.
//

import SwiftUI

@main
struct Garden14App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup(id: "MainWindow") {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 600, height: 600))

        ImmersiveSpace(id: "GardenSceneMixed") {
            ImmersiveViewMixed()
                .environment(appModel)
        }

        ImmersiveSpace(id: "GardenSceneProgressive") {
            ImmersiveViewMixed()
                .environment(appModel)
        }
        .immersionStyle(selection: .constant(.progressive), in: .progressive)

        ImmersiveSpace(id: "GardenSceneFull") {
            ImmersiveViewFull()
                .environment(appModel)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
