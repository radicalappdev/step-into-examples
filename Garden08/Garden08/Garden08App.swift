//
//  Garden08App.swift
//  Garden08
//
//  Created by Joseph Simpson on 10/2/24.
//

import SwiftUI

@main
struct Garden08App: App {

    @State private var flowerData = FlowerData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(flowerData)
        }
        .defaultSize(width: 500, height: 500)

        WindowGroup(id: "FlowerVolume", for: FlowerItem.self, content: { $value in
            Flower01Scene(item: $value)
        })
        .windowStyle(.volumetric)
        .defaultWindowPlacement { _, context in
            if let mainWindow = context.windows.last {
                return WindowPlacement(.trailing(mainWindow))
            }
            return WindowPlacement(.none)
        }


    }
}
