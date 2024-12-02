//
//  Garden16App.swift
//  Garden16
//
//  Created by Joseph Simpson on 12/2/24.
//

import SwiftUI

@main
struct Garden16App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(width: 500, height: 500)


        // Example 1: hardcoded frame size on the view, using sizeThatFits(.unspecified) to calculate the default placement
        WindowGroup(id: "RedFlower") {
            VStack {
                Text("🌺🌺🌺")
                Text("🌺🌺🌺")
                Text("🌺🌺🌺")
            }
            .font(.system(size: 128))
            .frame(width: 600, height: 500)
        }
        .windowResizability(.contentMinSize)
        .defaultWindowPlacement { content, context in
            let size = content.sizeThatFits(.unspecified)
            if let mainWindow = context.windows.first {
                return WindowPlacement(.leading(mainWindow), size: size)
            }
            return WindowPlacement(.none)
        }

        WindowGroup(id: "YellowFlower") {

            TabView {

                VStack {
                    Text("🌼🌼🌼")
                    Text("🌼🌼🌼")
                    Text("🌼🌼🌼")
                }
                .font(.system(size: 128))
                .tabItem {
                    Image(systemName: "1.circle.fill")
                    Text("Sunflower")
                }

                VStack {
                    Text("💐💐💐")
                    Text("💐💐💐")
                    Text("💐💐💐")
                }
                .font(.system(size: 128))
                .tabItem {
                    Image(systemName: "2.circle.fill")
                    Text("Roses")
                }
            }
            .frame(width: 600, height: 500)

        }
        .windowResizability(.contentMinSize)
        .defaultWindowPlacement { content, context in
            let size = content.sizeThatFits(.unspecified)
            if let mainWindow = context.windows.first {
                return WindowPlacement(.trailing(mainWindow), size: size)
            }
            return WindowPlacement(.none)
        }

     }
}
