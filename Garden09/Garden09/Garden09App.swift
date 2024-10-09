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

        // Initial scene as a window
//        WindowGroup {
//            ContentView()
//                .environment(appModel)
//        }
//        .defaultSize(width: 500, height: 500)

        // Initial scene as a Volume
        WindowGroup {
            VolumeExample()
                .environment(appModel)
        }
        .windowStyle(.volumetric)


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

        WindowGroup(id: "VolumeTrailing") {
            Box()
        }
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.trailing(mainWindow))
            }
            return WindowPlacement(.none)
        }

        WindowGroup(id: "VolumeBelow") {
            Box()
        }
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.below(mainWindow))
            }
            return WindowPlacement(.none)
        }

        WindowGroup(id: "VolumeAbove") {
            Box()
        }
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.above(mainWindow))
            }
            return WindowPlacement(.none)
        }

    }
}



