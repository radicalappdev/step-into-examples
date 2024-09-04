//
//  Garden06App.swift
//  Garden06
//
//  Created by Joseph Simpson on 8/15/24.
//

import SwiftUI

@main
struct Garden06App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup(id: "MainWindow") {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)
        .defaultWindowPlacement { content, context in
            if let new = context.windows.first(where: { $0.id == "YellowFlower" }) {
                return WindowPlacement(.leading(new))
            } else {
                return WindowPlacement(.none)
            }
        }

        WindowGroup(id: "YellowFlower") {
            YellowFlower()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)
        .defaultWindowPlacement { content, context in
            if let new = context.windows.first(where: { $0.id == "MainWindow" }) {
                return WindowPlacement(.trailing(new))
            } else {
                return WindowPlacement(.none)
            }
        }

    }
}
