//
//  ContentView.swift
//  Garden02
//
//  Created by Joseph Simpson on 7/29/24.
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

            VStack {
                Text("The Yellow Flower window has a new default size.")
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


            VStack {
                Text("The Red Flower window will animate size")
                HStack {
                    Button(action: {
                        openWindow(id: "RedFlower")
                    }, label: {
                        Label("Open Window", systemImage: "inset.filled.center.rectangle.badge.plus")
                    })

                    Button(action: {
                        dismissWindow(id: "RedFlower")
                    }, label: {
                        Label("Close Window", systemImage: "xmark.circle")
                    })
                }
            }


        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
