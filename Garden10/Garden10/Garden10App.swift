//
//  Garden10App.swift
//  Garden10
//
//  Created by Joseph Simpson on 10/10/24.
//

import SwiftUI

@main
struct Garden10App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
