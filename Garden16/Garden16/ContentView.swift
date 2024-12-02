//
//  ContentView.swift
//  Garden16
//
//  Created by Joseph Simpson on 12/2/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    @Environment(\.openWindow) var openWindow

    var body: some View {
        VStack(spacing: 24) {
            Text("Window Garden 🌸")
                .font(.extraLargeTitle2)

            Button(action: {
                openWindow(id: "YellowFlower")
                openWindow(id: "RedFlower")
                openWindow(id: "PurpleFlower")
                openWindow(id: "PinkFlower")
                openWindow(id: "Rocks")
            }, label: {
                Label("Open Windows", systemImage: "inset.filled.center.rectangle.badge.plus")
            })
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
