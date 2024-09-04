//
//  ContentView.swift
//  Garden06
//
//  Created by Joseph Simpson on 8/15/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) private var appModel

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack(spacing: 24) {
            Text("Window Garden 🌸")
                .font(.extraLargeTitle2)
            
            WindowController()

            Text("🌸🌸🌸🌸🌸")
                .padding()


        }
        .padding()
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .inactive, .background:
                appModel.mainWindowOpen = false
            case .active:
                appModel.mainWindowOpen = true
            @unknown default:
                appModel.mainWindowOpen = false
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
