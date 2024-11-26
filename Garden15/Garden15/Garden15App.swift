//
//  Garden15App.swift
//  Garden15
//
//  Created by Joseph Simpson on 11/26/24.
//

import SwiftUI

@main
struct Garden15App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 600, height: 600))

        ImmersiveSpace(id: "Bubble Garden", for: String.self, content: { $value in

            ImmersiveView(sceneName: $value)
                .environment(appModel)
        })
     }
}
