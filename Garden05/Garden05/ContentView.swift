//
//  ContentView.swift
//  Garden05
//
//  Created by Joseph Simpson on 8/14/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.pushWindow) private var pushWindow
    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack(spacing: 24) {
            Text("Window Garden \(appModel.selectedFlower)")
                .font(.extraLargeTitle2)

            Button(action: {
                pushWindow(id: "FlowerPicker")
            }, label: {
                Label("Change Flower", systemImage: "pencil")
            })

        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
