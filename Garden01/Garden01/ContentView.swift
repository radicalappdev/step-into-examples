//
//  ContentView.swift
//  Garden01
//
//  Created by Joseph Simpson on 7/28/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        VStack(spacing: 24) {

            Text("Window Garden 🌸")
                .font(.extraLargeTitle2)

            Text("Open and Close a window with an id value of `YellowFlower`")
            HStack {
                Button(action: {
                    openWindow(id: "YellowFlower")
                }, label: {
                    Label("Open Window", systemImage: "inset.filled.center.rectangle.badge.plus")
                })

                Button(action: {
                    dismissWindow(id: "YellowFlower")
                }, label: {
                    Label("Close Window", systemImage: "xmark.circle")
                })
            }

        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
