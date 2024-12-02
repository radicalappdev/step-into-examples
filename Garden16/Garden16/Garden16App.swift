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

        // Example 2: Set a min and max frame on the view. Use defaultSize to request an initial size, then pass in a larger size to the window placement to account for the size of the ornaments
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
            .frame(minWidth: 500, maxWidth: 700, minHeight: 400, maxHeight: 700)

        }
        .windowResizability(.contentSize)
        .defaultSize(CGSize(width: 600, height: 500))
        .defaultWindowPlacement { content, context in
            let size = CGSize(width: 700, height: 500)
            if let mainWindow = context.windows.first {
                return WindowPlacement(.trailing(mainWindow), size: size)
            }
            return WindowPlacement(.none)
        }

     }
}
