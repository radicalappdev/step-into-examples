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

            Text("Default Window Placement relative to the main window, accounting for the new window's size.")

            VStack(alignment: .leading, spacing: 12) {
                Text("Example 1: The initial size of the view is based on the content")
                Button(action: {
                    openWindow(id: "PinkFlower")
                }, label: {
                    Label("Open Example 1 🌸", systemImage: "inset.filled.center.rectangle.badge.plus")
                })

                Text("Example 2: hardcoded frame size on the view, using sizeThatFits(.unspecified) to calculate the default placement")
                Button(action: {
                    openWindow(id: "RedFlower")
                }, label: {
                    Label("Open Example 2 🌺", systemImage: "inset.filled.center.rectangle.badge.plus")
                })

                Text("Example 3: Set a min and max frame on the view. Use defaultSize to request an initial size, then pass in a larger size to the window placement to account for the size of the ornaments")
                Button(action: {
                    openWindow(id: "YellowFlower")
                }, label: {
                    Label("Open Example 3 🌼", systemImage: "inset.filled.center.rectangle.badge.plus")
                })
            }


        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
