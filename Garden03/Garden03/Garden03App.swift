//
//  Garden03App.swift
//  Garden03
//
//  Created by Joseph Simpson on 7/30/24.
//

import SwiftUI

@main
struct Garden03App: App {

    var body: some Scene {
        // Main window
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 500, height: 500)


        // Garden Windows
        WindowGroup(id: "YellowFlower") {
            Text("🌼")
                .font(.system(size: 128))
        }
        .defaultSize(CGSize(width: 300, height: 200))
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.leading(mainWindow))
            }
            return WindowPlacement(.none)
        }


        WindowGroup(id: "RedFlower") {
            Text("🌺")
                .font(.system(size: 128))
        }
        .defaultSize(CGSize(width: 300, height: 200))
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.trailing(mainWindow))
            }
            return WindowPlacement(.none)
        }

        WindowGroup(id: "PurpleFlower") {
            Text("🪻")
                .font(.system(size: 128))
        }
        .defaultSize(CGSize(width: 300, height: 200))
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.above(mainWindow))
            }
            return WindowPlacement(.none)
        }

        WindowGroup(id: "PinkFlower") {
            Text("🌷")
                .font(.system(size: 128))
        }
        .defaultSize(CGSize(width: 300, height: 200))
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.first {
                return WindowPlacement(.below(mainWindow))
            }
            return WindowPlacement(.none)
        }


        WindowGroup(id: "Rocks") {
            Text("🪨🪨🪨")
                .font(.system(size: 48))
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .defaultWindowPlacement { _, context in
            return WindowPlacement(.utilityPanel)
        }

    }
}
