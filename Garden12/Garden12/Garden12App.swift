//
//  Garden12App.swift
//  Garden12
//
//  Created by Joseph Simpson on 11/19/24.
//

import SwiftUI

@main
struct Garden12App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 600, height: 600))

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
        //        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
